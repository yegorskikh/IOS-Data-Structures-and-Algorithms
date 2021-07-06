import Foundation

public struct Heap<Element: Equatable> {
    
    var elements: [Element] = []
    let sort: (Element, Element) -> Bool
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
    
    public init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        buildHeap()
    }
    
    
    
    mutating public func buildHeap() {
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    
    
    mutating public func merge(heap: Heap) {
        elements = elements + heap.elements
        buildHeap()
    }
    
    
    
    /*
     1. Если индекс больше или равен количеству элементов в массиве, поиск не удался.
     2. Проверьте, имеет ли искомый элемент более высокий приоритет, чем текущий элемент с индексом i.
     Если это так, то элемент, который вы ищете, не может быть ниже в куче.
     3. Если элемент равен элементу с индексом i, вернуть i.
     4. Рекурсивно искать элемент, начиная с левого дочернего элемента i.
     5. Рекурсивно искать элемент, начиная с правого дочернего элемента i.
     6. Если оба поиска завершились неудачно, поиск не удался.
     */
    public func index(of element: Element, startingAt i: Int) -> Int? {
        
        if i >= count { return nil }
        
        if sort(element, elements[i]) { return nil }
        
        if element == elements[i] { return i }
        
        if let j = index(of: element,
                         startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        
        if let j = index(of: element,
                         startingAt: rightChildIndex(ofParentAt: i)) {
            return j
            
        }
        
        return nil
    }
    
    
    
    /*
     1. Убедитесь, что куча пуста. Если это так, верните ноль.
     2. Поменяйте местами корень с последним элементом в куче.
     3. Удалите последний элемент (максимальное или минимальное значение) и верните его.
     4. Куча больше не может быть максимальной или минимальной, поэтому вы должны выполнить отсев, чтобы убедиться, что она соответствует правилам.
     */
    public mutating func remove() -> Element? {
        
        guard !isEmpty else { return nil }
        
        elements.swapAt(0, count - 1)
        
        defer {
            siftDown(from: 0) // 4
        }
        
        return elements.removeLast() // 3
    }
    
    
    
    /*
     1. Проверьте, находится ли индекс в границах массива. Если нет, верните ноль.
     2. Если вы удаляете последний элемент в куче, ничего делать не нужно.
     специальный. Просто удалите и верните элемент.
     3. Если вы не удаляете последний элемент, сначала замените его последним.
     4. Затем вернитесь и удалите последний элемент.
     5. Наконец, выполните просеивание вниз и просеивание вверх, чтобы отрегулировать кучу.
     */
    public mutating func remove(at index: Int) -> Element? {
        
        guard index < elements.count else { return nil }
        
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count - 1)
            
            defer {
                siftDown(from: index) // 5
                siftUp(from: index)
            }
            
            return elements.removeLast() // 4
        }
    }
    
    
    
    mutating func siftUp(from index: Int) {
        
        var child = index
        var parent = parentIndex(ofChildAt: child)
        
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
        
    }
    
    
    
    /*
     1. Сохраните родительский индекс.
     2. Продолжайте просеивать, пока не вернетесь.
     3. Получите левый и правый дочерний индекс родителя.
     4. Переменная-кандидат используется для отслеживания того, какой индекс поменять местами с родительским.
     5. Если есть левый дочерний элемент, и он имеет более высокий приоритет, чем его родительский элемент,
     сделайте его кандидатом.
     6. Если есть правильный ребенок, и он имеет еще больший приоритет, он вместо этого станет кандидатом.
     7. Если кандидат по-прежнему является родителем, значит, вы достигли конца, и просеивания больше не требуется.
     8. Поменяйте местами кандидата с родителем и установите его в качестве нового родителя для продолжения просеивания.
     */
    mutating func siftDown(from index: Int) {
        
        var parent = index
        
        while true {
            
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            
            var candidate = parent
            
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parent {
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
        
    }
    
    
    
    public mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }
    
    
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
    
    
    
    func parentIndex(ofChildAt index: Int) -> Int {
        (index - 1) / 2
    }
    
    
    
    func peek() -> Element? {
        elements.first
    }
    
    
    
}
