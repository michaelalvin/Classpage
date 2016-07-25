//
//  CommentsViewController.swift
//  Classpage
//
//  Created by Michael Alvin on 7/13/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit
import Firebase

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var comments = [String]()
    var postObject: Post?
    let ref = FIRDatabase.database().reference()
    
    @IBOutlet weak var postOutlet: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postOutlet.text = postObject?.note
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell2")
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var commentTextField: UITextField!
    
    @IBAction func commentButton(sender: AnyObject) {
        let com = commentTextField.text
        
        self.comments.append(com!)
        
        let postItemRef = postObject!.ref!.child(com!)
        
        postItemRef.setValue(com)
        
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //        let cell = tableView.dequeueReusableCellWithIdentifier("myCell2", forIndexPath: indexPath) as! UITableViewCell
        //
        //        cell.textLabel?.text = commentTextField.text
        
        //        let cell = tableView.dequeueReusableCellWithIdentifier("myCell2", forIndexPath: indexPath) as! CommentsTableViewCell
        //
        //        cell.commentLabel?.text = commentTextField.text
        
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell2", forIndexPath: indexPath) as! UITableViewCell
        
        let currentComment = comments[indexPath.row]
        
        cell.textLabel?.text = currentComment
        
        return cell
        
        
    }
    
}
