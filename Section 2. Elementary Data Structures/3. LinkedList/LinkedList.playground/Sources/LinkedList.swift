import Foundation

public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public mutating func push(_ value: Value) {
        copyNodes()
        
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        copyNodes()
        
        guard !isEmpty else { return push(value) }
        
        tail!.next = Node(value: value)
        
        tail = tail!.next
    }
    
    public func node(at index: Int) -> Node<Value>? {
        
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        copyNodes()
        
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        copyNodes()
        
        defer {
            head = head?.next
            if isEmpty { tail = nil }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        copyNodes()
        
        guard let head = head else { return nil }
        
        guard head.next != nil else { return pop() }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        
        guard let node = copyNodes(returningCopyOf: node) else { return nil }
        
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    // COW
    private mutating func copyNodes() {
        
        guard !isKnownUniquelyReferenced(&head) else { return }
        
        guard var oldNode = head else { return }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        tail = newNode
    }
    
    private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
        
        guard !isKnownUniquelyReferenced(&head) else { return nil }
        
        guard var oldNode = head else { return nil }
        
        head = Node(value: oldNode.value)
        var newNode = head
        var nodeCopy: Node<Value>?
        
        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        
        return nodeCopy
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        
        guard let head = head else { return "Empty list" }
        
        return String(describing: head)
    }
    
}

// Custom collection indexes
extension LinkedList: Collection {
    
    public var startIndex: Index {
        Index(node: head)
    }
    
    public var endIndex: Index {
        Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
        position.node!.value
    }
    
    public struct Index: Comparable {
        
        public var node: Node<Value>?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
            
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else { return false }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
}

// CHALLENGE
extension LinkedList {
    
    // Challenge 1
    
    public func printInReverse<T>(_ list: LinkedList<T>) {
        printInReverse(list.head)
    }
    
    private func printInReverse<T>(_ node: Node<T>?) {
        guard let node = node else { return }
        printInReverse(node.next)
        print(node.value)
    }
    
    // Challenge 2
    
    func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
        var slow = list.head
        var fast = list.head
        
        while let nextFast = fast?.next {
            fast = nextFast.next
            slow = slow?.next
        }
        
        return slow
    }
    
    // Challenge 3
    
    mutating func reverse() {
        tail = head
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        head = prev
    }
    
    // Challenge 4
    
    func mergeSorted<T: Comparable>(_ left: LinkedList<T>,
                                    _ right: LinkedList<T>) -> LinkedList<T> {
        
      guard !left.isEmpty else { return right }
      
      guard !right.isEmpty else { return left }
      
      var newHead: Node<T>?
      var tail: Node<T>?
      
      var currentLeft = left.head
      var currentRight = right.head
      
      if let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
          newHead = leftNode
          currentLeft = leftNode.next
        } else {
          newHead = rightNode
          currentRight = rightNode.next
        }
        tail = newHead
      }
      
      while let leftNode = currentLeft, let rightNode = currentRight {
        
        if leftNode.value < rightNode.value {
          tail?.next = leftNode
          currentLeft = leftNode.next
        } else {
          tail?.next = rightNode
          currentRight = rightNode.next
        }
        
        tail = tail?.next
      }
      
      if let leftNodes = currentLeft {
        tail?.next = leftNodes
      }
      
      if let rightNodes = currentRight {
        tail?.next = rightNodes
      }
      
      var list = LinkedList<T>()
      list.head = newHead
      list.tail = {
        while let next = tail?.next {
          tail = next
        }
        return tail
      }()
      return list
    }
}
    // Challenge 5
extension LinkedList where Value: Equatable {
  
  mutating func removeAll(_ value: Value) {
    while let head = self.head, head.value == value {
      self.head = head.next
    }
    var prev = head
    var current = head?.next
    while let currentNode = current {
      if currentNode.next == nil {
        tail
      }
      guard currentNode.value != value else {
        prev?.next = currentNode.next
        current = prev?.next
        continue
      }
      prev = current
      current = current?.next
    }
    tail = prev
  }
}
