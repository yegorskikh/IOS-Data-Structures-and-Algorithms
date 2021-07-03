// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public struct AVLTree<Element: Comparable> {
    
    public private(set) var root: AVLNode<Element>?
    
    public init() {}
    
}

extension AVLTree: CustomStringConvertible {
    
    public var description: String {
        guard let root = root else { return "empty tree" }
        return String(describing: root)
    }
    
}

extension AVLTree {
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: AVLNode<Element>?, value: Element) -> AVLNode<Element> {
        guard let node = node else {
            return AVLNode(value: value)
        }
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value:
                                        value)
        }
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight,
                                  balancedNode.rightHeight) + 1
        return balancedNode
    }
    
    
    private func leftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        
        /*
         В качестве стержня выбирается правильный ребенок.
         Этот узел заменит повернутый узел в качестве корня поддерева (он переместится на уровень выше).
         */
        let pivot = node.rightChild!
        
        /*
         Узел, который нужно повернуть, станет левым дочерним элементом оси (он перемещается на уровень ниже).
         Это означает, что текущий левый дочерний элемент поворота должен быть перемещен в другое место.
         В общем примере, показанном на предыдущем изображении, это узел b. Поскольку b меньше y, но больше x,
         он может заменить y как правый дочерний элемент x.
         Таким образом, вы обновляете rightChild повернутого узла до leftChild поворотного узла.
         */
        node.rightChild = pivot.leftChild
        
        /*
         Теперь leftChild точки поворота можно установить как повернутый узел.
         */
        pivot.leftChild = node
        
        /*
         Вы обновляете высоту повернутого узла и точки поворота.
         */
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        
        /*
         Наконец, вы возвращаете точку поворота, чтобы она могла заменить повернутый узел в дереве.
         */
        return pivot
    }
    
    private func rightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        let pivot = node.leftChild!
        node.leftChild = pivot.rightChild
        pivot.rightChild = node
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        return pivot
    }
    
    private func rightLeftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        guard let rightChild = node.rightChild else { return node }
        node.rightChild = rightRotate(rightChild)
        return leftRotate(node)
    }
    
    private func leftRightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        guard let leftChild = node.leftChild else { return node }
        node.leftChild = leftRotate(leftChild)
        return rightRotate(node)
    }
    
    private func balanced(_ node: AVLNode<Element>) -> AVLNode<Element> {
        
        switch node.balanceFactor {
        case 2:
            if let leftChild = node.leftChild,
               leftChild.balanceFactor == -1 {
                return leftRightRotate(node)
            } else {
                return rightRotate(node)
            }
        case -2:
            if let rightChild = node.rightChild,
               rightChild.balanceFactor == 1 {
                return rightLeftRotate(node)
            } else {
                return leftRotate(node)
            }
        default:
            return node
        }
    }
    
    
    
}

extension AVLTree {
    
    public func contains(_ value: Element) -> Bool {
        
        var current = root
        
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        
        return false
    }
}

private extension AVLNode {
    
    var min: AVLNode {
        leftChild?.min ?? self
    }
    
}

extension AVLTree {
    
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: AVLNode<Element>?, value: Element) -> AVLNode<Element>? {
        
        guard let node = node else { return nil }
        
        if value == node.value {
            
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            
            if node.leftChild == nil {
                return node.rightChild
            }
            
            if node.rightChild == nil {
                return node.leftChild
            }
            
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        return balancedNode
    }
    
}
