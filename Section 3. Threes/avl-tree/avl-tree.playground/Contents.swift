// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "repeated insertions in sequence") {
    var tree = AVLTree<Int>()
    for i in 0..<15 {
        tree.insert(i)
    }
    print(tree)
}

example(of: "removing a value") {
    var tree = AVLTree<Int>()
    tree.insert(15)
    tree.insert(10)
    tree.insert(16)
    tree.insert(18)
    print(tree)
    tree.remove(10)
    print(tree)
}

import Foundation
// Challenge 1
/*
 How many leaf nodes are there in a perfectly balanced tree of height 3?
 What about a perfectly balanced tree of height h?
 */

func leafNodes(inTreeOfHeight height: Int) -> Int {
    Int(pow(2.0, Double(height)))
}
leafNodes(inTreeOfHeight: 3)

// Challenge 2
/*
 How many nodes are there in a perfectly balanced tree of height 3?
 What about a perfectly balanced tree of height h?
 */
func nodes(inTreeOfHeight height: Int) -> Int {
    Int(pow(2, Double(height + 1))) - 1
}

nodes(inTreeOfHeight: 3)

//  Challenge 3
/*
 Since there are many variants of binary trees, it makes sense to group shared functionality in a protocol.
 The traversal methods are a good candidate for this.
 
 Create a TraversableBinaryNode protocol that provides a default implementation
 of the traversal methods so that conforming types get these methods for free.
 Have AVLNode conform to this.
 */
protocol TraversableBinaryNode {
    
    associatedtype Element
    var value: Element { get }
    var leftChild: Self? { get }
    var rightChild: Self? { get }
    
    func traverseInOrder(visit: (Element) -> Void)
    func traversePreOrder(visit: (Element) -> Void)
    func traversePostOrder(visit: (Element) -> Void)
}

extension TraversableBinaryNode {
    
    func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

extension AVLNode: TraversableBinaryNode {}

example(of: "using TraversableBinaryNode") {
    var tree = AVLTree<Int>()
    for i in 0..<15 {
        tree.insert(i)
    }
    print(tree)
    tree.root?.traverseInOrder { print($0) }
}
