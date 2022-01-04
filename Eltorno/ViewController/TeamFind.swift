//
//  TeamFind.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 29/12/2021.
//

import UIKit
import Foundation
class TeamFind: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func findTeam(_ sender: Any) {
        profileUpdated()
    }
    
    @objc func profileUpdated(){
            UserDefaults.standard.string(forKey: "_id")
                    }

}
