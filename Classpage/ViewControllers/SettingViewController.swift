//
//  SettingViewController.swift
//  Classpage
//
//  Created by Michael Alvin on 7/12/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changePasswordAction(sender: AnyObject) {
        FIRAuth.auth()?.sendPasswordResetWithEmail(((FIRAuth.auth()?.currentUser?.email)!), completion: { (error) in
            if error == nil {
                print("An email with information on how to reset your password has been sent to you.")
            } else {
                print(error!.localizedDescription)
            }
        })
    }
    
    @IBAction func logOutAction(sender: AnyObject) {
        
        if FIRAuth.auth()?.currentUser != nil {
            do{
                try FIRAuth.auth()?.signOut()
                let vc = UIStoryboard(name: "Main", bundle:  nil).instantiateInitialViewController()
                presentViewController(vc!, animated: true, completion: nil)
                print("Signed out successfully")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            }
        }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


