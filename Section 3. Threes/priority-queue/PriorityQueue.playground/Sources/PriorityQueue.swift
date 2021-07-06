import Foundation

/*
 1. PriorityQueue будет соответствовать протоколу очереди.
    Общий параметр Element должен соответствовать Equatable, поскольку вам необходимо сравнивать элементы.
 2. Вы будете использовать эту кучу для реализации очереди с приоритетами.
 3. Передавая соответствующую функцию в этот инициализатор,
    PriorityQueue можно использовать для создания очередей с минимальным и максимальным приоритетом.
 */
public struct PriorityQueue<Element: Equatable>: Queue {
    
    private var heap: Heap<Element> // 2
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    var peek: Element? {
        heap.peek()
    }
    
    init(sort: @escaping (Element, Element) -> Bool,
         elements: [Element] = []) { // 3
        heap = Heap(sort: sort, elements: elements)
    }
    
    /*
     Из предыдущей главы вы должны понимать, что, вызывая enqueue (_ :), вы просто вставляете в кучу,
     и куча будет просеиваться, чтобы проверить себя. Общая сложность enqueue(_ :) равна O(log n).
     */
    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    
    /*
     Вызывая dequeue (_ :), вы удаляете корневой элемент из кучи, заменяя его последним элементом в куче,
     а затем просеиваете его для проверки кучи. Общая сложность dequeue() составляет O(log n).
     */
    mutating func dequeue() -> Element? { // 2
        heap.remove()
    }
    
}
