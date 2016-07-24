//
//  main.swift
//  LinkedList
//
//  Created by Mitul Manish on 23/07/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import Foundation

var linkedList = MyLinkedList()

for i in 1...1000 {
    linkedList.addItem(i)
}
// common operations
/*
1. add
2. search
3. removing an element
4. removing a node
5. print contents
*/
print(linkedList.printItems())
