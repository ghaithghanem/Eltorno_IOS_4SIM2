//
//  ProfileView.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 08/12/2021.
//

import Foundation
import UIKit
import DropDown

class ProfileView: UIViewController {
    var darkTheme = false
        let dropDown = DropDown()
        
        
    
    @IBAction func params(_ sender: Any) {
        dropDown.show()
    }
    
    @IBAction func Settings(_ sender: Any) {
        //dropDown.show()
        id()
        
    }
    
  
    @IBOutlet weak var imagez: UIImageView!
    
    
    @IBOutlet weak var nom: UITextField!
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        dropDownSelector()
                dropDown.dataSource = ["Securite","Modifier Profil","Theme","Déconnexion","Supprimer Profil"]
                dropDown.selectionBackgroundColor = .blue
        profileUpdated()
        imagez.imageFromServerURL(urlString: UserDefaults.standard.string(forKey: "profilePicture")!)
        let name = Notification.Name("updateProfil")
                NotificationCenter.default.addObserver(self, selector: #selector(profileUpdated), name: name, object: nil)
    }
    func dropDownSelector (){
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                if (item == "Modifier Profil"){
                    performSegue(withIdentifier: "modifierProfil", sender: nil)
                }
                else if (item == "Theme"){
                    let refreshAlert = UIAlertController(title: "Changer theme", message: "Etes vous sure de vouloir changer de theme ?", preferredStyle: UIAlertController.Style.alert)

                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                        if !darkTheme{
                            UIApplication.shared.windows.forEach { window in
                                window.overrideUserInterfaceStyle = .dark
                                print("change dark")
                                darkTheme = true
                            }
                        }
                        else{
                            UIApplication.shared.windows.forEach { window in
                                window.overrideUserInterfaceStyle = .light
                                print("change light")
                            }
                        }
                    }))
                    refreshAlert.addAction(UIAlertAction(title: "Annuler", style: .cancel, handler: { (action: UIAlertAction!) in
                        refreshAlert.dismiss(animated: true) {
                        }
                    }))
                    present(refreshAlert, animated: true, completion: nil)

                }
                else if (item == "Déconnexion"){
                                promptWithConfirm()
                    //performSegue(withIdentifier: "deconnect", sender: nil)
                    
                            }
                
                else if (item == "Supprimer Profil"){
                    let refreshAlert = UIAlertController(title: "Supprimer", message: "Etes vous sure de vouloir supprimer votre profile ?", preferredStyle: UIAlertController.Style.alert)

                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action: UIAlertAction!) in
                        UserAPI().deleteProfil { succes, reponse in
                            if succes{
                                self.clearData()
                                self.performSegue(withIdentifier: "deconnexion", sender: "ok")
                            }
                        }
                    }))
                    refreshAlert.addAction(UIAlertAction(title: "Annuler", style: .cancel, handler: { (action: UIAlertAction!) in
                        refreshAlert.dismiss(animated: true) {
                        }
                    }))
                    present(refreshAlert, animated: true, completion: nil)
                    
                }
            }
        }
    
    
    func clearData(){
            //let loginManager = LoginManager()
            //loginManager.logOut()
            UserDefaults.standard.removeObject(forKey: "_id")
            UserDefaults.standard.removeObject(forKey: "tokenConnexion")
            UserDefaults.standard.removeObject(forKey: "username")
            UserDefaults.standard.removeObject(forKey: "email")
            UserDefaults.standard.removeObject(forKey: "password")
            UserDefaults.standard.removeObject(forKey: "profilePicture")
            UserDefaults.standard.synchronize()
        }
    @objc func profileUpdated(){
        imagez.imageFromServerURL(urlString: UserDefaults.standard.string(forKey: "profilePicture")!)
            nom.text = UserDefaults.standard.string(forKey: "username")!.uppercased()
                    }
    @IBAction func deconnexion(_ sender: Any) {
            promptWithConfirm()
            
        }
    @objc func id(){
        UserDefaults.standard.string(forKey: "_id")
                    }

        let webS = UserAPI()
        
        
        
        
        
        
        func promptWithConfirm(){
            let refreshAlert = UIAlertController(title: "deconnexion", message: "Etes vous sure de vouloir vous deconnecter ?", preferredStyle: UIAlertController.Style.alert)

            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action: UIAlertAction!) in
                self.clearData()
                self.performSegue(withIdentifier: "deconnect", sender: "ok")
                
              }))

            refreshAlert.addAction(UIAlertAction(title: "Annuler", style: .cancel, handler: { (action: UIAlertAction!) in
                refreshAlert.dismiss(animated: true) {
                    
                }
            }))

            present(refreshAlert, animated: true, completion: nil)
        }
      
    }
    

