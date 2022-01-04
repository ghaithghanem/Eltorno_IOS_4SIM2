//
//  Signin.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 01/12/2021.
//

import UIKit
import GoogleSignIn
import LocalAuthentication

class Signin: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
          // if let token = AccessToken.current, !token.isExpired
        
               //performSegue(withIdentifier: "seg1", sender: "yes")
    
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordText.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seg" {
            let destination = segue.destination as! Signup
        }
       
    }
    
    @IBAction func Login(_ sender: UIButton) {
        
        if usernameText.text == "" || passwordText.text == "" {
                  self.showAlert(title: "Missing info !", message: "Please make sure to fill all the form and try again")
              }else      {   UserAPI().login(username: usernameText.text!, mdp: passwordText.text!) { succes, reponse in
            if succes, let json = reponse{
                    print("ahla bik",reponse)
                self.performSegue(withIdentifier: "seg1", sender: reponse)
                    print("succes")}
            
            else{
                self.propmt(title: "Echec", message: "Email ou mot de passe incorrect")
                print("failed")
            
            }
        }}
    }
    
    func testSegue(_ identifier: String!, sender:AnyObject!){
            performSegue(withIdentifier: identifier, sender: sender)
        }
    func propmt(title:String, message:String){
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let action = UIAlertAction(title: "OK", style: .destructive , handler: nil)
           alert.addAction(action)
           present(alert, animated: true, completion: nil)
       }
    
    
    let signInConfig = GIDConfiguration.init(clientID: "755962867232-mdfd8rbc1hib356peor04tfuo3h0vv7d.apps.googleusercontent.com")
   
    @IBAction func googlelogin(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: self
        ) { user, error in
            guard error == nil else { return }
            guard let user = user else { return }
            self.performSegue(withIdentifier: "seg1", sender: self)
            // Your user is signed in!
        }
    }
    func showAlert(title:String, message:String){
                    let alert = UIAlertController(title: title, message: message,preferredStyle: .alert)
                    let action = UIAlertAction(title:"ok", style: .cancel, handler:nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)

  }
    
    
    
    @IBAction func touchId(_ sender: Any) {
        
        let localString = "Biometric Authentication"
                let context = LAContext()
                   var error: NSError?

                   if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                       let reason = "Identify yourself!"

                       context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                           [weak self] success, authenticationError in

                           DispatchQueue.main.async {
                               if success {
                                   self!.performSegue(withIdentifier: "seg1", sender: IndexPath.self)
                               } else {
                                   // error
                               }
                           }
                       }
                   } else {
                       // no biometry
            }
    }
    
    
    
    
      }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       if segue.identifier == "seg1" {
//           let destination = segue.destination as! ProfileView
//       }
//   }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


