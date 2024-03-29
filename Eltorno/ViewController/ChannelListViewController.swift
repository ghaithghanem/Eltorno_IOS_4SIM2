//
//  ChannelListViewController.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 03/01/2022.
//

import SwiftUI
import SendBirdUIKit
class ChannelListViewController : UIViewController {
    
    // 3a. Create a UINavigationController with the Sendbird channel list
    //     view controller as it's root view controller
    @objc
    func displaySendbirdChanelList(){
        let clvc = SBUChannelListViewController()
        let navc = UINavigationController(rootViewController: clvc)
        navc.title = "Sendbird SwiftUI Demo"
        navc.modalPresentationStyle = .fullScreen
        present(navc, animated: true)
    }
    
    // 3b. Present the UINavigationController above
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        displaySendbirdChanelList()
    }
}

// 4. Create a UIViewControllerRepresentable struct
struct ChannelListViewContainer: UIViewControllerRepresentable {
    
    // 4a. Set the typealias to the class in step 3
    typealias UIViewControllerType = ChannelListViewController
    
    // 4b. Have the makeUIViewController return an instance of the class from step 3
    func makeUIViewController(context: Context) -> ChannelListViewController {
        return ChannelListViewController()
    }
    
    // 4c. Add the required updateUIViewController function
    func updateUIViewController(_ uiViewController: ChannelListViewController, context: Context) {
    }
    
}
