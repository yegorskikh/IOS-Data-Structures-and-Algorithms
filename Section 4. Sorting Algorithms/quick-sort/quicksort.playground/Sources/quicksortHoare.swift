import Foundation

public func partitionHoare<T: Comparable>(_ a: inout [T],
                                          low: Int,
                                          high: Int ) -> Int {
    /*
     Выберите первый элемент как опорный.
     */
    let pivot = a[low]
    
    /*
     Индексы i и j определяют две области. Каждый индекс перед i будет меньше или равен оси поворота.
     Каждый индекс после j будет больше или равен оси поворота.
     */
    var i = low - 1
    var j = high + 1
    
    while true {
        
        /*
         Уменьшайте j, пока не дойдете до элемента, не превышающего точку поворота.
         */
        repeat { j -= 1 } while a[j] > pivot
        
        /*
         Увеличивайте i, пока не дойдете до элемента, который не меньше точки поворота.
         */
        repeat { i += 1 } while a[i] < pivot
        
        /*
         Если i и j не перекрываются, поменяйте местами элементы.
         */
        if i < j {
            a.swapAt(i, j)
        } else {
            /*
             Верните индекс, разделяющий оба региона.
             */
            return j
        }
    }
    
}

public func quicksortHoare<T: Comparable>(_ a: inout [T],
                                          low: Int,
                                          high: Int) {
    if low < high {
        let p = partitionHoare(&a, low: low, high: high)
        quicksortHoare(&a, low: low, high: p)
        quicksortHoare(&a, low: p + 1, high: high)
    }
    
}
