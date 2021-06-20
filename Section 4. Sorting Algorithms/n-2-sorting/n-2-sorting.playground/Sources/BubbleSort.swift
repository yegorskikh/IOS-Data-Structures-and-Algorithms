import Foundation

/*
public func bubbleSort<Element>(_ array: inout [Element]) where Element: Comparable {
    
    // Нет необходимости сортировать коллекцию, если в ней меньше двух элементов.
    guard array.count >= 2 else { return }
    
    /*
     За один проход наибольшее значение перемещается в конец коллекции.
     Каждый проход должен сравнивать на одно значение меньше, чем в предыдущем проходе,
     поэтому вы существенно сокращаете массив на единицу с каждым проходом.
     */
    for end in (1..<array.count).reversed() {
        var swapped = false
        // Этот цикл выполняет один проход; он сравнивает соседние значения и меняет их местами, если необходимо.
        for current in 0..<end {
            if array[current] > array[current + 1] {
                array.swapAt(current, current + 1)
                swapped = true
            }
        }
        
        /*
         Если на этом проходе значения не были заменены местами, коллекцию необходимо отсортировать,
         и вы можете выйти раньше.
         */
        if !swapped { return }
    }
}
*/

public func bubbleSort<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable {
    
    guard collection.count >= 2 else { return }
    
    for end in collection.indices.reversed() {
        
        var swapped = false
        var current = collection.startIndex
        
        while current < end {
            let next = collection.index(after: current)
            if collection[current] > collection[next] {
                collection.swapAt(current, next)
                swapped = true
            }
            current = next
        }
        
        if !swapped { return }
    }
    
}
