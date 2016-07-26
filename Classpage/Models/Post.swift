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
    
    init(note: String) {
        self.note = note
        self.modificationTime = NSDate()
        self.ref = nil
        self.comment = []
    }
    
    
    init(snapshot: FIRDataSnapshot) {
        note = snapshot.value!["note"] as! String
        ref = snapshot.ref
        modificationTime = NSDate()
    }
    
    func toAnyObject() -> [String:AnyObject] {
        return [
            "note": note,
            "comment" : comment!
        ]
    }
    
}