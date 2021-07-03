// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

var exampleTree: BinarySearchTree<Int> {
    var bst = BinarySearchTree<Int>()
    bst.insert(3)
    bst.insert(1)
    bst.insert(4)
    bst.insert(0)
    bst.insert(2)
    bst.insert(5)
    return bst
}

example(of: "building a BST") {
    print(exampleTree)
}

example(of: "finding a node") {
    if exampleTree.contains(5) {
        print("Found 5!")
    } else {
        print("Couldn’t find 5")
    }
}

example(of: "removing a node") {
    var tree = exampleTree
    print("Tree before removal:")
    print(tree)
    tree.remove(3)
    print("Tree after removing root:")
    print(tree)
}

// Challenge 1
var bst = BinarySearchTree<Int>()
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)
print(bst)
bst.root!.isBinarySearchTree

// Challenge 2

var bst1 = BinarySearchTree<Int>()
bst1.insert(3)
bst1.insert(1)
bst1.insert(4)
bst1.insert(0)
bst1.insert(2)
bst1.insert(5)

print(bst1)

var bst2 = BinarySearchTree<Int>()
bst2.insert(2)
bst2.insert(5)
bst2.insert(3)
bst2.insert(1)
bst2.insert(0)
bst2.insert(4)

bst1 == bst2

// Challenge 3

var bst3 = BinarySearchTree<Int>()
bst3.insert(3)
bst3.insert(1)
bst3.insert(4)
bst3.insert(0)
bst3.insert(2)
bst3.insert(5)

var bst4 = BinarySearchTree<Int>()
bst4.insert(2)
bst4.insert(5)
bst4.insert(3)
bst4.insert(1)
bst4.insert(0)
// bst4.insert(100)

bst.contains(bst2)
