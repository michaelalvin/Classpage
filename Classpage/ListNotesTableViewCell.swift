//
//  ListNotesTableViewCell.swift
//  Classpage
//
//  Created by Michael Alvin on 7/12/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

class ListNotesTableViewCell: UITableViewCell {
    @IBOutlet weak var noteLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var upsLabel: UILabel!
    
    var counter = 0
    
    var postObject: Post?
    
    @IBAction func upButton(sender: AnyObject) {
        let objectReference = postObject!.ref!.child("ups")
        
        objectReference.setValue(String(Int(postObject!.ups)! + 1))
    }
    
    @IBAction func commentButton(sender: AnyObject) {
    }
    
    
}
