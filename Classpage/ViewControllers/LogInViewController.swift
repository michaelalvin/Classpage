//
//  LogInViewController.swift
//  Classpage
//
//  Created by Michael Alvin on 7/13/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class LogInViewController: UIViewController {

    let logInToList = "logInToList"
    let ref = FIRDatabase.database().reference()
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createUser(sender: AnyObject) {
        FIRAuth.auth()?.createUserWithEmail(usernameField.text!, password: passwordField.text!, completion: { user, error in
            
            if error != nil{
                self.login()
            } else {
                print("User created")
                self.login()
                self.performSegueWithIdentifier(self.logInToList, sender: nil)

            }
        })
            }
    
    func login(){
        FIRAuth.auth()?.signInWithEmail(usernameField.text!, password: passwordField.text!, completion: { user, error in
            
            if error != nil{
                print("Incorrect")
            } else {
                print("Signed in successfully")
                self.performSegueWithIdentifier(self.logInToList, sender: nil)
                print((FIRAuth.auth()?.currentUser?.email)!)
            }
        })
    
}
}
