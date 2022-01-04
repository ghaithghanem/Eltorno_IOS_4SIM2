//
//  ForgotPasword.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 30/12/2021.
//

import UIKit
import Foundation
class ForgotPasword: UIViewController {
    var code = ""
        @IBAction func validerButton(_ sender: Any) {
            UserAPI().forgotPassword(email: emailConcerne.text!) { success, reponse in
                if success{
                    self.code = reponse! as! String
                }

            }
        }
        @IBAction func validerCodeButton(_ sender: Any) {
            if (codeTextfield.text!.elementsEqual(self.code)){
                performSegue(withIdentifier: "confirmationCode", sender: code)
            }
            
        }
        
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "confirmationCode" {
        
                    let destination = segue.destination as! ResetPassController
        
                    destination.email = emailConcerne.text!
                    destination.code = self.code
                }
        
            }
        @IBOutlet weak var codeTextfield: UITextField!
        @IBOutlet weak var emailConcerne: UITextField!
        override func viewDidLoad() {
            super.viewDidLoad()
        }

}
