//
//  Array.swift
//  prog4.1
//
//  Created by Hena Malhotra on 8/2/18.
//  Copyright © 2018 Hena. All rights reserved.
//

import Foundation

/**
 Indexed array of objects
 
 */
class Array : CustomStringConvertible {
    var description: String
    
    
    var list : LinkedList
    
    init(list: LinkedList? = nil) {
        self.list = list!
        //list.count = 0
        //list.type(of: init)(list: list)
        
    }
    // STORED PROPERTIES
    
    private var _count: Int    // Stored property that counts elements in the array
    
    // COMPUTED PROPERTIES
    
    /**
     Computed property that returns the number of elements in the array - overrides
     LinkedList property to return stored _count property rather than traversing
     the list and coutning the elements.
     
     - returns: Int Number of items in the array
     */
    var count: Int {
        return self._count
    }
    
    subscript(index: Int) -> Any {
        get {
            return self.get(index: index)
        }
        set(newObject) {
            self.set(object: newObject, at: index)
        }
    }
    
    func get(index: Int) -> Any {
        assert(index < self.count)
        assert(index >= 0)
        
   
            var node: Node? = list.head;
            // Walk through the list until the
            // specified index
            if index > 0 {
                for _ in 1...index {
                    if let n = node {
                        node = n.next;
                    } else {
                        // Exit early if index
                        // exceeds number of
                        // items on the list
                        return nil;
                    }
                }
            }
            return node;
    }
    
    func set(object: Any, at index: Int) {
        assert(index < self.count)
        assert(index >= 0)
        
        let node = list.getNodeAtIndex(index: index)!
        node.object = object
        
    }
    
    /**
     Sort the list using the provided compare function
     
     - parameter isObject: A function that compares two objects and
     returns true if the first one is smaller than the second one
     
     */
    func sort(isObject: (Any, Any) -> Bool) {
        
        while true {
            var swap: Bool = false;
            
            var nodeLeft: Node? = list.head
            
            // Walk through the nodes in the list
            while let nLeft = nodeLeft  {
                // Get the next node in the list
                if let nRight = nLeft.next {
                    // Invoked the function that got passed
                    // in as a parameter to check if the
                    // object that follows the current one
                    // on the list is smaller - if yes,
                    // then swap the object of the two nodes
                    if(isObject(nRight.object, nLeft.object)) {
                        nLeft.swapObjectsWith(n: nRight)
                        swap = true
                    }
                }
                nodeLeft = nLeft.next
            }
            
            // Check if anything got swapped in this
            // pass through the entire list - if not,
            // then the entire list has been completely
            // sorted
            if !swap {
                break;
            }
        }
    }

    
    // INITIALISERS
    
    /**
     Designated initialiser for Array - overrides LinkedList initialiser
     in order to initialise the _count stored property
     
     - parameter list: LinkedList to initialise array with (nil by default)
     */
    /*init(list: LinkedList? = nil) {
        list.count = 0
        list.init(list: list)
    }*/
    
    // METHODS
    
    /**
     Adds an object to the array - overrrides LinkedList method
     in order to increment the _count variable when new object
     is added.
     
     - parameter object: Object to add to the list
     */
    func add(object: Any) {
        list.add(object: object)
        var count = list.count += 1
    }
    
    /**
     Removes a node from the array - overrideds LinkedList method
     in order to decrement the _count variable when an node (and object)
     is removed form the list
     
     - parameter node: Node to remove from the list
     - returns: Bool True if node found in the list and removed,
     false otherwise.
     */
    func remove(node: Node) -> Bool {
        let nodeRemoved: Bool = list.remove(node: node)
        if nodeRemoved {
            var count = list._count -= 1
        }
        return nodeRemoved
    }
    
    
    //
}
