//
//  tournoiFind.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 29/12/2021.
//

import UIKit
import Foundation
class tournoiFind: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func id(_ sender: Any) {
        user()
    }
    
    @objc func user(){
            UserDefaults.standard.string(forKey: "_id")
                    }

}
