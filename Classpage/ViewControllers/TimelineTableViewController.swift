//
//  TimelineTableViewController.swift
//  Classpage
//
//  Created by Michael Alvin on 7/12/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class TimelineTableViewController: UITableViewController {
    
    var items = [Post]()
    
    let ref = FIRDatabase.database().reference()
    
    @IBAction func commentButton(sender: AnyObject) {
        self.performSegueWithIdentifier("listToComments", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "listToComments"{
            
        let vc = segue.destinationViewController as! CommentsViewController
            
        let indexPath = tableView.indexPathForSelectedRow
            
        let object = items[(indexPath?.item)!]
            
        vc.postObject = object
        }
    }
    
    
    
    @IBAction func upButton(sender: AnyObject) {
        let indexPath = tableView.indexPathForSelectedRow
        
        let object = items[(indexPath?.item)!]
        
        let objectRef = object.ref!.child("ups")
        
        objectRef.setValue(String(Int(object.ups)! + 1))
    }
    
   
    
    @IBAction func addButton(sender: AnyObject) {
        let alert = UIAlertController(title: "Post", message: "Create a post",
                                      preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default){
            (action: UIAlertAction!) -> Void in
            
            let textField = alert.textFields![0]
            
            let post = Post(note: textField.text!, time: NSDate())
            
            self.items.append(post)
            
            let postItemRef = self.ref.child((textField.text)!)
            
            postItemRef.setValue(post.toAnyObject())
            
            self.tableView.reloadData()
            
            
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel",style: .Default) {
            (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsMultipleSelectionDuringEditing = false
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        ref.queryOrderedByChild("ups").observeEventType(.Value, withBlock:{ snapshot in
            
            var newItems = [Post]()
            
            for item in snapshot.children{
                let postItem = Post(snapshot: item as! FIRDataSnapshot)
                newItems.append(postItem)
            }
            
            let reverseRandomCollection = newItems.reverse()
           
            let reverseArray = Array(reverseRandomCollection)
            
            self.items = reverseArray
            
            
            self.tableView.reloadData()
        })

//        ref.queryOrderedByKey().observeEventType(.Value, withBlock:{ snapshot in
//            
//        var newItems = [Post]()
//            
//            for item in snapshot.children{
//                let postItem = Post(snapshot: item as! FIRDataSnapshot)
//                newItems.append(postItem)
//            }
//            
//            self.items = newItems
//            self.tableView.reloadData()
//        })
        
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! ListNotesTableViewCell
        
        let post = items[indexPath.row]

        cell.noteLabel.text = post.note
        
        //cell.timeLabel.text = post.modificationTime.convertToString()
        
        cell.timeLabel.text = post.modificationTime
        
        cell.upsLabel.text = post.ups
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let postItem = items[indexPath.row]
            postItem.ref?.removeValue()

        }
    }
}


extension NSDate {
    func convertToString() -> String {
        return NSDateFormatter.localizedStringFromDate(self, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
    }
}
