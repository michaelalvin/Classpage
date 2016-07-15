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
    
    @IBAction func upButton(sender: AnyObject) {
        counter += 1
        upsLabel.text = String(counter)
    }
    
    
    @IBAction func commentButton(sender: AnyObject) {
    }
    
}
