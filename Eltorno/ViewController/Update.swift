//
//  Update.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 08/12/2021.
//

import Foundation
import UIKit

class Update: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var username: UITextField!
   
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var photoDeProfilImageView: UIImageView!
    
    override func viewDidLoad() {
        username.text = UserDefaults.standard.string(forKey: "username")
                email.text = UserDefaults.standard.string(forKey: "email")
       
               
                super.viewDidLoad()
                print("le token est profile modifier profile",UserDefaults.standard.string(forKey: "tokenConnexion")!)

                photoDeProfilImageView.contentMode = UIView.ContentMode.scaleAspectFit
                
                photoDeProfilImageView.imageFromServerURL(urlString: UserDefaults.standard.string(forKey: "profilePicture")!)
             
    }
  
    
    
    @IBAction func update(_ sender: Any) {
       
        if isValidEmail(email.text!){
                   var user :User?
            if (UserDefaults.standard.string(forKey: "username") ?? "").isEmpty{
                            if (username.text!.isEmpty){
                                user = User( username: username.text!, email: email.text!, profilePicture: "",id: UserDefaults.standard.string(forKey: "_id")!,  __v: 0)
                            }
                            else{
                                user = User( username: username.text!,  email: email.text!, password: "", profilePicture: "",id: UserDefaults.standard.string(forKey: "_id")!, __v: 0)
                            }
                            }
                            else{
                            user = User( username: username.text!, email: self.email.text!, password: UserDefaults.standard.string(forKey: "password")!, profilePicture: "",id: UserDefaults.standard.string(forKey: "_id")!, __v: 0)
                        }
                            
                   
                       
                       let pictureUrl = NSURL(string: UserDefaults.standard.string(forKey: "profilePicture")!)
                   print(user!)
                       let imageData = NSData(contentsOf: pictureUrl! as URL)
                       let faza = UIImage(data: imageData as! Data)
                   UserAPI().UpdateProfil(user: user!, image: photoDeProfilImageView.image!) { succes, reponse in
                               if succes, let json = reponse{
                                   
                                   let name = Notification.Name("updateProfil")
                                   let notification = Notification(name: name)
                                   NotificationCenter.default.post(notification)
                                   DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                       self.dismiss(animated: true)
		
                                   }
                               }
                               else{
                                   
                                   print(reponse)
                               }
                           }
                       
               }
                }
        
    
    
    
    @IBAction func parcourir(_ sender: Any) {
        let picker = UIImagePickerController()
               picker.allowsEditing = true
               picker.delegate = self
               present(picker, animated: true)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.editedImage] as? UIImage else {
                return
            }
            photoDeProfilImageView.image = image
            
            dismiss(animated: true)
        }
    func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
    
    func propmt(title:String, message:String){
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let action = UIAlertAction(title: "OK", style: .destructive , handler: nil)
           alert.addAction(action)
           self.present(alert, animated: true, completion: nil)
       }

}
