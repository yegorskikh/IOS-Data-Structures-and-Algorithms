import Foundation

// 1. Find the height of the binary tree.
public func height<T>(of node: BinaryNode<T>?) -> Int {
    
    guard let node = node else { return -1 }
    
    return 1 + max(height(of: node.leftChild), height(of: node.rightChild))
}
