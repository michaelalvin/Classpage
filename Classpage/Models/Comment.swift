//
//  Comment.swift
//  Classpage
//
//  Created by Michael Alvin on 7/13/16.
//  Copyright © 2016 Make School. All rights reserved.
//

//
//  Post.swift
//  Classpage
//
//  Created by Michael Alvin on 7/12/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import Firebase

//struct Comment {
//    
//    let comments: String!
//    let ref: FIRDatabaseReference?
//    let modificationTime: NSDate
//    
//    init(comments: String) {
//        self.comments = comments
//        self.modificationTime = NSDate()
//        self.ref = nil
//    }
//    
//    
//    init(snapshot: FIRDataSnapshot) {
//        comments = snapshot.value!["note"] as! String
//        ref = snapshot.ref
//        modificationTime = NSDate()
//    }
//    
//    func toAnyObject() -> AnyObject {
//        return [
//            "comments": comments,
//        ]
//    }
//    
//}