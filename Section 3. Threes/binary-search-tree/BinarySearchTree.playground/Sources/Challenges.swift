import Foundation

// 1
extension BinaryNode where Element: Comparable {
    
    var isBinarySearchTree: Bool {
        isBST(self, min: nil, max: nil)
    }
    
    private func isBST(_ tree: BinaryNode<Element>?,
                       min: Element?,
                       max: Element?) -> Bool {
        
        guard let tree = tree else { return true }
        
        if let min = min, tree.value <= min {
            return false
        } else if let max = max, tree.value > max {
            return false
        }
        
        return isBST(tree.leftChild, min: min, max: tree.value) &&
            isBST(tree.rightChild, min: tree.value, max: max)
    }
    
}



// 2

extension BinarySearchTree: Equatable {
    
    public static func ==(lhs: BinarySearchTree, rhs: BinarySearchTree) -> Bool {
        isEqual(lhs.root, rhs.root)
    }
    
    private static func isEqual<Element: Equatable>(_ node1: BinaryNode<Element>?,
                                                    _ node2: BinaryNode<Element>?) -> Bool {
        
        guard let leftNode = node1, let rightNode = node2 else {
            return node1 == nil && node2 == nil
        }
        
        return leftNode.value == rightNode.value &&
            isEqual(leftNode.leftChild, rightNode.leftChild) &&
            isEqual(leftNode.rightChild, rightNode.rightChild)
    }
}



// 3

extension BinarySearchTree where Element: Hashable {
    
    public func contains(_ subtree: BinarySearchTree) -> Bool {
        
        var set: Set<Element> = []
        var isEqual = true
        
        root?.traverseInOrder {
            set.insert($0)
        }
        
        subtree.root?.traverseInOrder {
            isEqual = set.contains($0)
        }
        
        return isEqual
    }
    
}
