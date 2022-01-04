//
//  TeamAPI.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 21/12/2021.
//

import Foundation
import UIKit

class TeamAPI{
func DataBody(team:Team, media: [Media]?, boundary: String) -> Data {
        let lineBreak = "\r\n"
        var body = Data()
        
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition: form-data; name=\"name\"\(lineBreak + lineBreak)")
        body.append("\(team.name! + lineBreak)")
        
        if let media = media {
            for photo in media {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(photo.key)\"; filename=\"\(photo.filename)\"\(lineBreak)")
                body.append("Content-Type: \(photo.mimeType + lineBreak + lineBreak)")
                body.append(photo.data)
                body.append(lineBreak)
            }
        }
        body.append("--\(boundary)--\(lineBreak)")
        return body
    }
    func generateBoundary() -> String {
            return "Boundary-\(NSUUID().uuidString)"
        }


    
    func FoundTeam(team:Team, image :UIImage, callback: @escaping (Bool,Any?)->Void){
            
            guard let mediaImage = Media(withImage: image, forKey: "photoProfil") else { return }
            guard let url = URL(string: "http://localhost:3000/api/team/create/random") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            //create boundary
            let boundary = generateBoundary()
            //set content type
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            //call createDataBody method
            
        let dataBody = DataBody(team:team, media: [mediaImage], boundary: boundary)
            request.httpBody = dataBody
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
              
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let test = try decoder.decode(Team.self, from: data)
                            callback(true,test)
                        }catch{
                            print("erreur de decodage (add): ",error)
                            callback(false,"erreur decodage")
                        }
                    } else{
                        callback(false,"no data")
                    }
                }
            }.resume()
        }
    

    
    
    
    struct Media {
        let key: String
        let filename: String
        let data: Data
        let mimeType: String
        init?(withImage image: UIImage, forKey key: String) {
            self.key = key
            self.mimeType = "image/jpeg"
            self.filename = "imagefile.jpg"
            guard let data = image.jpegData(compressionQuality: 0.7) else { return nil }
            self.data = data
        }
    }
}
   
extension UIImageView {
    public func ImageFromServerURL(urlString: String) {
        self.image = nil
        let urlStringNew = urlString.replacingOccurrences(of: " ", with: "%20")
        URLSession.shared.dataTask(with: NSURL(string: urlStringNew)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error as Any)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
}


