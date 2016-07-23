//
//  ChangePasswordViewController.swift
//  Classpage
//
//  Created by Michael Alvin on 7/22/16.
//  Copyright © 2016 Make School. All rights reserved.
//


import UIKit
import Firebase
import FirebaseAuth

class ChangePasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var usernameNameField: UITextField!
    
    @IBAction func resetPassword(sender: AnyObject) {
        FIRAuth.auth()?.sendPasswordResetWithEmail(usernameNameField.text!, completion: { (error) in
            if error == nil {
                print("An email with information on how to reset your password has been sent to you.")
            } else {
                print(error!.localizedDescription)
            }
        })
    }
}
