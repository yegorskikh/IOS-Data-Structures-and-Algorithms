// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public struct QueueStack<T> : Queue {
    
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        
        /*
         Убедитесь, что левая стопка пуста.
         */
        if leftStack.isEmpty {
            
            /*
             Установите ее как обратную сторону правой стопки.
             */
            leftStack = rightStack.reversed()
            
            /*
             Сделайте недействительной правую стопку. Поскольку вы перенесли все влево, просто очистите его.
             */
            rightStack.removeAll()
        }
        
        /*
         Удалите последний элемент из левой стопки.
         */
        return leftStack.popLast()
    }
}

extension QueueStack: CustomStringConvertible {
    
    public var description: String {
        String(describing: leftStack.reversed() + rightStack)
    }
    
}



var queue = QueueStack<String>()
queue.enqueue("Ray") // true
queue.enqueue("Brian") // true
queue.enqueue("Eric") // true
queue // ["Ray", "Brian", "Eric"]
queue.dequeue() // "Ray"
queue // ["Brian", "Eric"]
queue.peek // "Brian"
