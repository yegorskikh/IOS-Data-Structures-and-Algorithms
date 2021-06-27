// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class QueueLinkedList<T>: Queue {
    
    private var list = DoublyLinkedList<T>()
    public init() {}
    
    // O(1)
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    
    // O(1)
    public func dequeue() -> T? {
        
        guard
            !list.isEmpty,
            let element = list.first
        else {
            return nil
        }
        
        return list.remove(element)
    }
    
    public var peek: T? {
        return list.first?.value
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
}

extension QueueLinkedList: CustomStringConvertible {
    
    public var description: String {
        String(describing: list)
    }
    
}



var queue = QueueLinkedList<String>() // end
queue.enqueue("Ray") // true
queue.enqueue("Brian") // true
queue.enqueue("Eric") // true
queue // Ray -> Brian -> Eric -> end
queue.dequeue() // "Ray"
queue // Brian -> Eric -> end
queue.peek // "Brian"
