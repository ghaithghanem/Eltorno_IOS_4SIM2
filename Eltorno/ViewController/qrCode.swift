//
//  qrCode.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 30/12/2021.
//

import UIKit
import UserNotifications

class qrCode: UIViewController {

    
    
    @IBOutlet weak var nameText: UITextField!
    
    
    @IBOutlet weak var qrImageView: UIImageView!
    
    
    
    @IBAction func generateAction(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "this is a local notification"
        content.sound = .default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        center.add(request) { (error) in
            if error != nil {
                print("Error = \(error?.localizedDescription ?? "error local notification")")
            }
        }
        let myName = nameText.text
        if let name = myName{
            let combinedString = "\(name)\n\(Date())"
            qrImageView.image = GenerateQRCode(Name:combinedString)
        }
    }
    func GenerateQRCode(Name:String)->UIImage?{
        let name_data = Name.data(using:String.Encoding.ascii)
        if let filter = CIFilter(name:"CIQRCodeGenerator"){
            filter.setValue(name_data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            if let output = filter.outputImage?.transformed(by: transform){
                return UIImage(ciImage: output)
            }
        }
        return nil 
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
