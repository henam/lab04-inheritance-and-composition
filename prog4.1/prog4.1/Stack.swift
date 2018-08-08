//
//  Stack.swift
//  prog4.1
//
//  Created by Hena Malhotra on 8/2/18.
//  Copyright © 2018 Hena. All rights reserved.
//

import Foundation

/**
 A queue of objects
 
 */
class Stack : LinkedList {
    
    /**
     Queue desription - adds a string indicating the
     container is a queue before invoking super's description
     
     - returns: String String representation of the queue
     */
    override var description: String {
        return "(Stack)<--"+super.description+"<--"
    }
    
    /**
     Puts an an object at the end of the queue
     
     - parameter object: Object to put in the queue.
     */
    func push(object: Any) {
        // Use inherited method to add object
        // to the list
        self.add(object: object);
    }
    
    /**
     Gets an an object from the start of the queue
     
     - returns: Any? Object removed from the start of the queue,
     nil if queue is empy.
     */
    func pop() -> Any? {
        // If head points to a non-nil node,
        // remove that node and return its
        // object
        if let n = tail {
            //Use inherited method to remove
            //node from the list
            self.remove(node: n)
            return n.object
        } else {
            return nil
        }
    }
}
