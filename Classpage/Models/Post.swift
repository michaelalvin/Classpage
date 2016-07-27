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
    let modificationTime: NSDate
    var comment: [String]?
    var ups: String!
    
    init(note: String) {
        self.note = note
        self.modificationTime = NSDate()
        self.ref = nil
        self.comment = []
        self.ups = "0"
    }
    
    
    init(snapshot: FIRDataSnapshot) {
        note = snapshot.value!["note"] as! String
        ref = snapshot.ref
        modificationTime = NSDate()
        ups = snapshot.value!["ups"] as! String
    }
    
    func toAnyObject() -> [String:AnyObject] {
        return [
            "note": note,
            "comment" : comment!,
            "ups": ups
        ]
    }
    
}