//
//  ResetPassController.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 30/12/2021.
//

import UIKit
import Foundation
class ResetPassController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
        }
        var code :String?
        var email : String?
        @IBAction func validerResetButton(_ sender: Any) {
            UserAPI().resetPass(password: password.text!, email: email!, code: code!) { succes, reponse in
                if succes{
                    //self.performSegue(withIdentifier: "retour", sender: "nil")
                }
                else{
                    print("erreur reset pass")
                }
            }
        }
        
        @IBOutlet weak var password: UITextField!

   

}
