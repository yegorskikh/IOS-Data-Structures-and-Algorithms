// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

// TESTING

var heap = Heap(sort: >, elements: [1,12,3,4,1,6,8,7])

while !heap.isEmpty {
    print(heap.remove()!)
}



// CHALLENGES 1

/*
 1. Инициализируйте min-heap несортированным массивом.
 2. current отслеживает n-й наименьший элемент.
 3. Пока куча не пуста, продолжайте удалять элементы.
 4. Удалите корневой элемент из кучи.
 5. Убедитесь, что вы достигли n-го наименьшего элемента. если да, верните элемент.
 6. Если нет, увеличьте ток.
 7. Верните nil, если куча пуста.
 */
func getNthSmallestElement(n: Int, elements: [Int]) -> Int? {
    
   var heap = Heap(sort: <, elements: elements)
   
    var current = 1
    
    while !heap.isEmpty {
        
        let element = heap.remove()
        
        if current == n {
            return element
        }
        
        current += 1
    }
    
    return nil
}

let elements = [3, 10, 18, 5, 21, 100]
let nthElement = getNthSmallestElement(n: 3, elements: elements)



// CHALLENGE 4

func leftChildIndex(ofParentAt index: Int) -> Int {
  (2 * index) + 1
}

func rightChildIndex(ofParentAt index: Int) -> Int {
  (2 * index) + 2
}

func isMinHeap<Element: Comparable> (elements: [Element]) -> Bool {
    
  guard !elements.isEmpty else { return true }
  
  for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
    let left = leftChildIndex(ofParentAt: i)
    let right = rightChildIndex(ofParentAt: i)
    
    if elements[left] < elements[i] {  return false }
    
    if right < elements.count && elements[right] < elements[i]  { return false }
  }
  
  return true
}

let elements4 = [1, 3, 12, 5, 10, 18, 21, 6, 8, 11, 15, 100, 20]
isMinHeap(elements: elements4)
