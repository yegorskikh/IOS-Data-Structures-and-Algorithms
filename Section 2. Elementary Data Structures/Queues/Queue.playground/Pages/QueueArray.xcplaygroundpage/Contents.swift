// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public struct QueueArray<T>: Queue {
    
    private var array: [T] = []
    public init() {}
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var peek: T? {
        array.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}



extension QueueArray: CustomStringConvertible {
    
    public var description: String {
        String(describing: array)
    }
    
}

var queue = QueueArray<String>()
queue.enqueue("Ray") // true
queue.enqueue("Brian") // true
queue.enqueue("Eric") // true
queue // ["Ray", "Brian", "Eric"]
queue.dequeue() // "Ray"
queue // ["Brian", "Eric"]
queue.peek // "Brian"





// Challenge

// 3

public protocol BoardGameManager {
    
    associatedtype Player
    mutating func nextPlayer() -> Player?
}

extension QueueArray: BoardGameManager {
    
    public typealias Player = T
    
    public mutating func nextPlayer() -> T? {
        guard let person = dequeue() else { return nil }
        enqueue(person)
        return person
    }
}

var queue3 = QueueArray<String>()
queue3.enqueue("Vincent")
queue3.enqueue("Remel")
queue3.enqueue("Lukiih")
queue3.enqueue("Allison")
print(queue3)

print("===== boardgame =======")
queue3.nextPlayer()
print(queue3)
queue3.nextPlayer()
print(queue3)
queue3.nextPlayer()
print(queue3)
queue3.nextPlayer()
print(queue3)

// 4


//extension QueueArray {
//
//  func reversed() -> QueueArray {
//
//    var queue = self
//    var stack = Stack<T>()
//
//    while let element = queue.dequeue() {
//      stack.push(element)
//    }
//    while let element = stack.pop() {
//      queue.enqueue(element)
//    }
//    return queue
//  }
//}
//
//var queue4 = QueueArray<String>()
//queue4.enqueue("1")
//queue4.enqueue("21")
//queue4.enqueue("18")
//queue4.enqueue("42")
//
//print("before: \(queue4)")
//print("after: \(queue4.reversed())")

// 5

//enum Direction {
//    
//    case front
//    case back
//}
//
//protocol Deque {
//    associatedtype Element
//    
//    var isEmpty: Bool { get }
//    
//    func peek(from direction: Direction) -> Element?
//    
//    mutating func enqueue(_ element: Element,
//                          to direction: Direction) -> Bool
//    
//    mutating func dequeue(from direction: Direction) -> Element?
//}
//
//class DequeDoubleLinkedList<Element>: Deque {
//    
//    private var list = DoublyLinkedList<Element>()
//    public init() {}
//    
//    var isEmpty: Bool {
//        list.isEmpty
//    }
//    
//    func peek(from direction: Direction) -> Element? {
//        
//        switch direction {
//        case .front:
//            return list.first?.value
//        case .back:
//            return list.last?.value
//        }
//    }
//    
//    func enqueue(_ element: Element, to direction: Direction) -> Bool {
//        switch direction {
//        case .front:
//            list.prepend(element)
//        case .back:
//            list.append(element)
//        }
//        return true
//    }
//    
//    func dequeue(from direction: Direction) -> Element? {
//        let element: Element?
//        switch direction {
//        case .front:
//            guard let first = list.first else { return nil }
//            element = list.remove(first)
//        case .back:
//            guard let last = list.last else { return nil }
//            element = list.remove(last)
//        }
//        return element
//    }
//}
//
//extension DequeDoubleLinkedList: CustomStringConvertible {
//    
//    public var description: String {
//        String(describing: list)
//    }
//}
//
//
//let deque = DequeDoubleLinkedList<Int>()
//deque.enqueue(1, to: .back)
//deque.enqueue(2, to: .back)
//deque.enqueue(3, to: .back)
//deque.enqueue(4, to: .back)
//
//print(deque)
//
//deque.enqueue(5, to: .front)
//
//print(deque)
//
//deque.dequeue(from: .back)
//deque.dequeue(from: .back)
//deque.dequeue(from: .back)
//deque.dequeue(from: .front)
//deque.dequeue(from: .front)
//deque.dequeue(from: .front)
//
//print(deque)
