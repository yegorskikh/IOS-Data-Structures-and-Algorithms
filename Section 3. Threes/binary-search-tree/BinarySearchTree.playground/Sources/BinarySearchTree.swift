import Foundation

public struct BinarySearchTree<Element: Comparable> {
    
    public private(set) var root: BinaryNode<Element>?
    
    public init() {}
    
}

extension BinarySearchTree: CustomStringConvertible {
    
    public var description: String {
        guard let root = root else { return "empty tree" }
        return String(describing: root)
    }
    
}

extension BinarySearchTree {
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    private func insert(from node: BinaryNode<Element>?,
                        value: Element) -> BinaryNode<Element> {
        
        /*
         Это рекурсивный метод, поэтому для его завершения требуется базовый случай.
         Если текущий узел равен нулю, вы нашли точку вставки и возвращаете новый BinaryNode.
         */
        guard let node = node else {
            return BinaryNode(value: value)
        }
        
        /*
         Поскольку типы элементов сопоставимы, вы можете выполнить сравнение.
         Этот оператор if определяет, в каком направлении должен проходить следующий вызов вставки.
         Если новое значение меньше текущего, вы вызываете insert для левого дочернего элемента.
         Если новое значение больше или равно текущему значению,
         вы вызовете insert для правого дочернего элемента.
         */
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        /*
         Вернуть текущий узел. Это делает возможными назначения вида node = insert(from: node, value: value),
         поскольку insert либо создаст узел (если он был равен нулю), либо вернет узел (он не был нулевым).
         */
        return node }
}

extension BinarySearchTree {
    
    public func contains(_ value: Element) -> Bool {
        
        /*
         Начните с установки тока для корневого узла.
         */
        var current = root
        
        /*
         Пока current не равен нулю, проверьте значение текущего узла.
         */
        while let node = current {
            
            /*
             Если значение совпадает с тем, что вы пытаетесь найти, верните true.
             */
            if node.value == value {
                return true
            }
            
            /*
             В противном случае решите, собираетесь ли вы проверять левого или правого ребенка.
             */
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        
        return false
    }
    
}

private extension BinaryNode {
    
    var min: BinaryNode {
        leftChild?.min ?? self
    }
    
}

extension BinarySearchTree {
    
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element)
    -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        
        if value == node.value {
            
            /*
             В случае, когда узел является листовым, вы просто возвращаете nil, тем самым удаляя текущий узел.
             */
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            
            /*
             Если у узла нет левого дочернего элемента, вы возвращаете node.rightChild,
             чтобы повторно подключить правое поддерево.
             */
            if node.leftChild == nil {
                return node.rightChild
            }
            
            /*
             Если у узла нет правого дочернего элемента, вы возвращаете node.leftChild,
             чтобы повторно подключить левое поддерево.
             */
            if node.rightChild == nil {
                return node.leftChild
            }
            
            /*
             Это тот случай, когда удаляемый узел имеет как левый, так и правый дочерний элемент.
             Вы заменяете значение узла наименьшим значением из правого поддерева.
             Затем вы вызываете remove для правого дочернего элемента, чтобы удалить это замененное значение.
             */
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
            
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
    
}
