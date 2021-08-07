//
//  ViewController.swift
//  testui
//
//  Created by cybermonkey on 05/08/21.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button(_ sender: UIButton) {
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                     error: &error){
            let reason = "please use touch id"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason){[weak self]sucess, error in
                DispatchQueue.main.async {
                    guard sucess, error == nil else {
                        
                        let alert = UIAlertController(title: "Failed to authenticate",
                                                      message: "please try again",
                                                      preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "failed", style: .cancel, handler: nil))
                        self?.present(alert, animated: true)
                        return
                    }
                    
                    
                    let storyboard = UIStoryboard(name: "secondscreen", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "myVCID")
                    self?.present(vc, animated: true)
                }
            }
        }
        else {
            let alert = UIAlertController(title: "unavailable", message: "you cant use this feature", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    
    }
    

}
