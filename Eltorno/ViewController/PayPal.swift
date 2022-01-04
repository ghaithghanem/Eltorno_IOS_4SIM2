//
//  PayPal.swift
//  Eltorno
//
//  Created by Mac-Mini-2021 on 30/12/2021.
//

import UIKit
import Braintree
class PayPal: UIViewController {

    var braintreeClient: BTAPIClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        braintreeClient = BTAPIClient(authorization: "sandbox_pgnf9rzw_r69z658jvtfxpk9q")
       
       
                        // Access additional information
                    
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func PayPalbt(_ sender: Any) {
       
        let payPalDriver = BTPayPalDriver(apiClient: braintreeClient)
                payPalDriver.viewControllerPresentingDelegate = self
                payPalDriver.appSwitchDelegate = self
        let request = BTPayPalRequest(amount: "2.32")
               request.currencyCode = "USD" // Optional; see BTPayPalRequest.h for more options

               payPalDriver.requestOneTimePayment(request) { (tokenizedPayPalAccount, error) in
                   if let tokenizedPayPalAccount = tokenizedPayPalAccount {
                       print("Got a nonce: \(tokenizedPayPalAccount.nonce)")

                       // Access additional information
                       let email = tokenizedPayPalAccount.email
                       let firstName = tokenizedPayPalAccount.firstName
                       let lastName = tokenizedPayPalAccount.lastName
                       let phone = tokenizedPayPalAccount.phone

                       // See BTPostalAddress.h for details
                       let billingAddress = tokenizedPayPalAccount.billingAddress
                       let shippingAddress = tokenizedPayPalAccount.shippingAddress
                   } else if let error = error {
                       // Handle error here...
                   } else {
                       // Buyer canceled payment approval
                   }
               }
        
    }
    
    
}
extension PayPal : BTViewControllerPresentingDelegate {
    func paymentDriver(_ driver: Any, requestsPresentationOf viewController: UIViewController) {
        
    }
    
    func paymentDriver(_ driver: Any, requestsDismissalOf viewController: UIViewController) {
        
    }
    
    
}

extension PayPal : BTAppSwitchDelegate {
    func appSwitcherWillPerformAppSwitch(_ appSwitcher: Any) {
        
    }
    
    func appSwitcher(_ appSwitcher: Any, didPerformSwitchTo target: BTAppSwitchTarget) {
        
    }
    
    func appSwitcherWillProcessPaymentInfo(_ appSwitcher: Any) {
        
    }
    
    
}
