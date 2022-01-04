//
//  tournoiView.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 29/12/2021.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
class tournoiView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var tourcollect: UICollectionView!
    
    @IBOutlet weak var tounoi: UICollectionView!
    var usernameList = [String]()
    //var usernameList1 = [String]()
    var photoList = [String]()
    //var photoList1 = [String]()
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(usernameList.count)
        return usernameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "xcell", for: indexPath)
        let cv = cell.contentView
        let playerName = cv.viewWithTag(3) as! UILabel
        //let playerName2 = cv.viewWithTag(4) as! UILabel
        let playerImg = cv.viewWithTag(1) as! UIImageView
        //let playerImg2 = cv.viewWithTag(2) as! UIImageView
        
        playerName.text = usernameList[indexPath.row]
        //playerName2.text = usernameList1[indexPath.row]
        var imageUrl = String(photoList[indexPath.row]).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
              imageUrl = imageUrl.replacingOccurrences(of: "%5C", with: "/", options: NSString.CompareOptions.literal, range: nil)
               let url = URL(string: imageUrl)!
               playerImg.af.setImage(withURL: url)
        
        
        
       // var imageUrl1 = String(photoList1[indexPath.row]).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
              //imageUrl1 = imageUrl1.replacingOccurrences(of: "%5C", with: "/", options: NSString.CompareOptions.literal, range: nil)
               //let url1 = URL(string: imageUrl1)!
               //playerImg2.af.setImage(withURL: url1)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tournoiFunction()
        // Do any additional setup after loading the view.
    }
    //func collectionView(_ collectionView: UICollectionView, layoutcollectionViewLayout: UICollectionViewLayout)

    func tournoiFunction() {
            AF.request("http://localhost:3000/api/tournoi/create/random/"+UserDefaults.standard.string(forKey: "_id")!, method: .post).responseJSON{
                response in
                switch response.result{


                case .success:

                    //                print(response)
                    let myresult = try? JSON(data: response.data!)

                    print(myresult)
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
                    //for i in myresult!["members"].arrayValue {
                        //print(i)
                        //let username = i["username"].stringValue
                        //let photo = i["profilePicture"].stringValue
                       
                        //print("hedhy heya eltaswira: ", photo)
                        //self.usernameList1.append(username)
                       // self.photoList1.append(photo)
                       

                        // print(image)
                    //}
                     self.tounoi.reloadData()
                    break
                case .failure:



                    print("CHECK INTERNET CONNECTION!!!!!!!!!!")
                    print(response.error!)

                    break
                }
            }
        }

}
