//
//  LinkedList.swift
//  LinkedList
//
//  Created by Mitul Manish on 23/07/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation

class MyLinkedList {
    
    private var head: Node?
    private var listLength: Int?
    private var itemNotFound: Bool?
    
    init() {
        listLength = 0
        itemNotFound = false
    }
    
    func getHead() -> Node? {
        return head
    }
    
    var getListLength: Int {
        get {
            return listLength!
        }
    }
    
    func addItem(value: Int) {
        let currentNode = searchItem(value)
        
        if (itemNotFound!) {
            let newNode = Node(value: value)
            if let head = getHead() {
                newNode.nextConnectedNode = head
            }
            
            head = newNode
            itemNotFound = false
            listLength! += 1
            
        } else if currentNode == nil {
            if let head = getHead() {
                head.incrementCounter()
            }
        } else {
            currentNode?.nextConnectedNode?.incrementCounter()
        }
    }
    
    internal func search(value: Int) -> Int {
        var currentNode = searchItem(value)
        
        if itemNotFound! {
            return 0
        } else if currentNode == nil {
            return getHead()!.getCounterValue()
        } else {
            currentNode = currentNode?.nextConnectedNode
            return (currentNode?.getCounterValue())!
        }
    }
    
    private func searchItem(value: Int) -> Node? {
        
        var currentNode = getHead()
        var prevNode: Node?
        
        while currentNode != nil {
            if currentNode?.nodeValue == value {
                return prevNode
            }
            
            prevNode = currentNode
            currentNode = currentNode!.nextConnectedNode
        }
        
        itemNotFound = true
        return nil
    }
    
    internal func removeOne(value: Int) {
        let prevNode = searchItem(value)
        
        if itemNotFound!{
            itemNotFound = false
        } else {
            let currentNode = prevNode == nil ? getHead()! : prevNode?.nextConnectedNode
            
            if currentNode?.countValue > 1 {
                currentNode?.decrementCounter()
            } else {
                removeNode(prevNode)
            }
        }
    }
    
    private func removeNode(prevNode: Node?) {
        if prevNode == nil {
            head = head?.nextConnectedNode
        } else {
            let currentNode = prevNode!.nextConnectedNode
            prevNode!.setNextNode((currentNode?.nextConnectedNode)!)
            self.listLength! -= 1
        }
    }
    
    internal func removeAll(value: Int) {
        let prevNode = searchItem(value)
        
        if itemNotFound! {
            itemNotFound = false
        } else {
            removeNode(prevNode)
        }
    }
    
    internal func printItems() {
        var currentNode: Node?
        
        if let head = getHead() {
            currentNode = head
        }
        
        while currentNode != nil {
            let value = currentNode!.nodeValue
            let count = currentNode!.countValue
            
            print("Value: \(value) ----  Count: \(count)")
            currentNode = currentNode?.nextConnectedNode
        }
    }
    
    
    
    class Node {
        
        private var value: Int?
        private var count: Int?
        private var nextNode: Node?
        
        init(value: Int) {
            self.value = value
            self.count = 1
        }
        
        internal var nodeValue: Int {
            get {
                return value ?? 0
            }
            set(newValue) {
                self.value = newValue
            }
        }
        
        internal var countValue: Int {
            get {
                return count!
            }
        }
        
        internal var nextConnectedNode: Node? {
            get {
                return nextNode
            }
            
            set(node) {
                self.nextNode = node
            }
        }
        
        internal func setNextNode(node: Node) {
            self.nextNode = node
        }
        
        internal func incrementCounter() {
            self.count! += 1
        }
        
        internal func decrementCounter() {
            self.count! -= 1
        }
        
        internal func getCounterValue() -> Int {
            return count ?? 0
        }
    }
}