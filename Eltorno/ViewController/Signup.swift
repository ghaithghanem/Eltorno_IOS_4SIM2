//
//  Signup.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 01/12/2021.
//

import UIKit

class Signup: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    // VAR
 
    var pseudo: String?
    var motDePasse: String?
    var currentUser: Bool?
   
 
    @IBAction func Parcourir(_ sender: Any) {
        let picker = UIImagePickerController()
                picker.allowsEditing = true
                picker.delegate = self
                present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.editedImage] as? UIImage else {
                return
            }
        photoProfileImageView.image = image
            
            dismiss(animated: true)
        }
    // WIDGET
    @IBOutlet weak var pseudoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var motDePasseTextField: UITextField!
   
    @IBOutlet weak var confirmPasswordtextField: UITextField!
    
    
    @IBOutlet weak var photoProfileImageView: UIImageView!
    // PROTOCOLS
    
    // LIFECYCLE
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motDePasseTextField.isSecureTextEntry = true
    }
    @IBAction func okokok(_ sender: Any) {
        if( pseudoTextField.text == "" || emailTextField.text == "" || motDePasseTextField.text == "" ){
                    showAlert(title: "Warning", message: "Please make sure to fill out all the form before registering")
                    return
                }else
        if (!(confirmPasswordtextField.text! == motDePasseTextField.text)){
                    showAlert(title: "Failure", message: "Password do not match")
                    return
                }
        let user =  User( username: pseudoTextField.text!, email: emailTextField.text!, password: motDePasseTextField.text!, profilePicture: "", id: "", __v: 0)
        UserAPI().CreationCompte(user: user, image: photoProfileImageView.image!) { succes, dataUser in
            if succes{
                print(dataUser)
            }else
            {
                print("error inserting the user")
            }
        
    }
    
}
    func showAlert(title:String, message:String){
            let alert = UIAlertController(title: title, message: message,preferredStyle: .alert)
            let action = UIAlertAction(title:"ok", style: .cancel, handler:nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        }
    func propmt(title:String, message:String){
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .destructive , handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
}
