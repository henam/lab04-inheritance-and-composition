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
class Array : SortableList {
    
    // STORED PROPERTIES
    
    private var _count: Int    // Stored property that counts elements in the array
    
    // COMPUTED PROPERTIES
    
    /**
     Computed property that returns the number of elements in the array - overrides
     LinkedList property to return stored _count property rather than traversing
     the list and coutning the elements.
     
     - returns: Int Number of items in the array
     */
    override var count: Int {
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
        
        let node = self.getNodeAtIndex(index: index)!
        return node.object
        
    }
    
    func set(object: Any, at index: Int) {
        assert(index < self.count)
        assert(index >= 0)
        
        let node = self.getNodeAtIndex(index: index)!
        node.object = object
        
    }
    
    // INITIALISERS
    
    /**
     Designated initialiser for Array - overrides LinkedList initialiser
     in order to initialise the _count stored property
     
     - parameter list: LinkedList to initialise array with (nil by default)
     */
    override init(list: LinkedList? = nil) {
        self._count = 0
        super.init(list: list)
    }
    
    // METHODS
    
    /**
     Adds an object to the array - overrrides LinkedList method
     in order to increment the _count variable when new object
     is added.
     
     - parameter object: Object to add to the list
     */
    override func add(object: Any) {
        super.add(object: object)
        self._count += 1
    }
    
    /**
     Removes a node from the array - overrideds LinkedList method
     in order to decrement the _count variable when an node (and object)
     is removed form the list
     
     - parameter node: Node to remove from the list
     - returns: Bool True if node found in the list and removed,
     false otherwise.
     */
    override func remove(node: Node) -> Bool {
        let nodeRemoved: Bool = super.remove(node: node)
        if nodeRemoved {
            self._count -= 1
        }
        return nodeRemoved
    }
    
    
    //
}
