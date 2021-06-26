import Foundation

public func partitionDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int, pivotIndex: Int) -> (Int, Int) {
    
    let pivot = a[pivotIndex]
    
    /*
     Каждый раз, когда вы сталкиваетесь с элементом, который меньше точки поворота,
     переместите его на меньший индекс.
     Это означает, что все элементы, предшествующие этому индексу, меньше точки поворота.
     */
    var smaller = low
    
    /*
     Указать равные точки до следующего элемента для сравнения. Элементы,
     которые равны стержню, пропускаются, что означает,
     что все элементы между меньшим и равным равны стержню.
     */
    var equal = low
    
    /*
     Каждый раз, когда вы сталкиваетесь с элементом, который больше, чем точка поворота,
     переместите его, чтобы индекс был больше. Это означает, что все элементы,
     следующие после этого индекса, больше, чем точка поворота.
     */
    var larger = high
    
    /*
     Основной цикл сравнивает элементы и меняет их местами, если необходимо.
     Это продолжается до тех пор, пока равный индекс не переместится за пределы индекса большего размера,
     что означает, что все элементы будут перемещены в правильную секцию.
     */
    while equal <= larger {
        
        if a[equal] < pivot {
            a.swapAt(smaller, equal)
            smaller += 1
            equal += 1
        } else if a[equal] == pivot {
            equal += 1
        } else {
            a.swapAt(equal, larger)
            larger -= 1
        }
    }
    
    /*
     Алгоритм возвращает индексы все меньше и больше.
     Они указывают на первый и последний элементы среднего раздела.
     */
    return (smaller, larger)
}

public func quicksortDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    
    if low < high {
        let (middleFirst, middleLast) = partitionDutchFlag(&a,
                                                           low: low,
                                                           high: high,
                                                           pivotIndex: high)
        
        quicksortDutchFlag(&a, low: low, high: middleFirst - 1)
        quicksortDutchFlag(&a, low: middleLast + 1, high: high)
    }
    
}

