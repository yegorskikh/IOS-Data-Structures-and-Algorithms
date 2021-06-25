// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

struct Heap<Element: Equatable> {
    
    var elements: [Element] = []
    let sort: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        
        self.sort = sort
        self.elements = elements
        
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i, upTo: elements.count)
            }
        }
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
    
    func peek() -> Element? {
        elements.first
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
    
    mutating func remove() -> Element? {
        
        guard !isEmpty else { return nil }
        
        elements.swapAt(0, count - 1)
        
        defer {
            siftDown(from: 0, upTo: elements.count)
        }
        
        return elements.removeLast()
    }
    
    mutating func siftDown(from index: Int, upTo size: Int) {
        
        var parent = index
        
        while true {
            
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            
            if left < size && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < size && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
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
    
    mutating func remove(at index: Int) -> Element? {
        
        guard index < elements.count else { return nil } // 1
        
        if index == elements.count - 1 {
            return elements.removeLast() // 2
        } else {
            elements.swapAt(index, elements.count - 1) // 3
            
            defer {
                siftDown(from: index, upTo: elements.count) // 5
                siftUp(from: index)
            }
            
            return elements.removeLast() // 4
        }
    }
    
    func index(of element: Element, startingAt i: Int) -> Int? {
        
        if i >= count { return nil }
        
        if sort(element, elements[i]) { return nil }
        
        if element == elements[i] {
            return i
        }
        
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        
        return nil
    }
    
}




extension Heap {
    
    func sorted() -> [Element] {
        
        /*
         Вы сначала делаете копию кучи. После сортировки кучи массив элементов больше не является допустимой кучей.
         Работая с копией кучи, вы гарантируете, что куча останется действительной.
         */
        var heap = Heap(sort: sort, elements: elements)
        
        /*
         Вы просматриваете массив, начиная с последнего элемента.
         */
        for index in heap.elements.indices.reversed() {
            
            /*
             Вы меняете местами первый элемент и последний элемент.
             Это перемещает самый большой неотсортированный элемент на его правильное место.
             */
            heap.elements.swapAt(0, index)
            
            /*
             Поскольку куча теперь недействительна, вы должны отсеять новый корневой узел.
             В результате следующий по величине элемент станет новым корнем.
             */
            heap.siftDown(from: 0, upTo: index)
        }
        
        return heap.elements
    }
    
}

let heap = Heap(sort: >, elements: [6, 12, 2, 26, 8, 18, 21, 9, 5])

print(heap.sorted()) // [2, 5, 6, 8, 9, 12, 18, 21, 26]

// Challenges

extension Array where Element: Comparable {
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
    
    mutating func siftDown(from index: Int, upTo size: Int) {
        var parent = index
        
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            
            if (left < size) && (self[left] > self[candidate]) {
                candidate = left
            }
            
            if (right < size) && (self[right] > self[candidate]) {
                candidate = right
            }
            
            if candidate == parent {
                return
            }
            
            swapAt(parent, candidate)
            parent = candidate
        }
        
    }
    
    mutating func heapSort() {
        // Build Heap
        if !isEmpty {
            for i in stride(from: count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i, upTo: count)
            }
        }
        
        // Perform Heap Sort.
        for index in indices.reversed() {
            swapAt(0, index)
            siftDown(from: 0, upTo: index)
        }
    }
    
}

var array = [6, 12, 2, 26, 8, 18, 21, 9, 5]
array.heapSort()


/*
 2. Theory
 
 When performing a heap sort in ascending order, which of these starting
 arrays requires the fewest comparisons?
 
 - `[1,2,3,4,5]`
 - `[5,4,3,2,1]`
 
 `[5,4,3,2,1]` will yield the fewest number of comparisons, since it’s
 already a max heap and no swaps take place.
 
 
 
 3. Descending Order
 
 The chapter implementation of heap sort, sorts the elements in ascending order.
 How would you sort in descending order?
 
 
 Simply use a min heap instead of a max heap before sorting:
 let heap = Heap(sort: <, elements: [6, 12, 2, 26, 8, 18, 21, 9, 5])
 print(heap.sorted())
 */
