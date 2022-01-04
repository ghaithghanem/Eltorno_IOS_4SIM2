//
//  TeamView.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 21/12/2021.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
class TeamView: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    

    @IBOutlet weak var imageU: UITableView!
    @IBOutlet weak var tableTeam: UITableView!
    var usernameList = [String]()
    var photoList = [String]()
    
    

    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usernameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell", for: indexPath)
        let cv = cell.contentView
        let photo = cv.viewWithTag(1) as! UIImageView
        let username = cv.viewWithTag(2) as! UILabel
        username.text = usernameList[indexPath.row]
        
       
        
        
        var imageUrl = String(photoList[indexPath.row]).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
              imageUrl = imageUrl.replacingOccurrences(of: "%5C", with: "/", options: NSString.CompareOptions.literal, range: nil)
               let url = URL(string: imageUrl)!
               photo.af.setImage(withURL: url)
        
        
        
        return cell
    }
    
  
    
    
    
    @objc func profileUpdated(){
           // UserDefaults.standard.string(forKey: "_id")
                    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getComments()
        
        // Do any additional setup after loading the view.
    }
    
    
    func getComments() {
            AF.request("http://localhost:3000/api/team/create/random/"+UserDefaults.standard.string(forKey: "_id")!, method: .post).responseJSON{
                response in
                switch response.result{


                case .success:

                    //                print(response)
                    let myresult = try? JSON(data: response.data!)

                    //print(myresult)
                    self.usernameList.removeAll()
                    self.photoList.removeAll()



                    for i in myresult!["members"].arrayValue {
                        print(i)
                        let username = i["username"].stringValue
                        let photo = i["profilePicture"].stringValue
                       
                        print("hedhy heya eltaswira: ", photo)
                        self.usernameList.append(username)
                        self.photoList.append(photo)
                       

                        // print(image)
                    }
                     self.tableTeam.reloadData()
                    break
                case .failure:



                    print("CHECK INTERNET CONNECTION!!!!!!!!!!")
                    print(response.error!)

                    break
                }
            }
        }
    
}
