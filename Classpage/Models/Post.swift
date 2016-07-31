//
//  Post.swift
//  Classpage
//
//  Created by Michael Alvin on 7/12/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import Firebase

struct Post {
    
    let note: String!
    let ref: FIRDatabaseReference?
    // let modificationTime: NSDate
    let modificationTime: String!
    var comment: [String]?
    var ups: String!
    
    init(note: String, time: NSDate) {
        self.note = note
        // self.modificationTime = time
        self.modificationTime = time.convertToString()
        self.ref = nil
        self.comment = []
        self.ups = "0"
    }
    
    
    init(snapshot: FIRDataSnapshot) {
        note = snapshot.value!["note"] as! String
        ref = snapshot.ref
        // modificationTime = NSDate()
        modificationTime = snapshot.value!["modificationTime"] as! String
        ups = snapshot.value!["ups"] as! String
    }
    
    func toAnyObject() -> [String:AnyObject] {
        return [
            "note": note,
            "comment" : comment!,
            "ups": ups,
            "modificationTime": modificationTime
        ]
    }
    
}