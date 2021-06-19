import Foundation

/*
 public func insertionSort<Element>(_ array: inout [Element]) where Element: Comparable {
 
 guard array.count >= 2 else { return }
 
 // Сортировка вставкой требует, чтобы вы выполняли итерацию слева направо один раз.
 for current in 1..<array.count {
 
 // Здесь вы бежите назад от текущего индекса, чтобы при необходимости можно было сдвинуть влево.
 for shifting in (1...current).reversed() {
 
 /*
 Сдвигайте элемент влево столько, сколько необходимо. Как только элемент займет позицию,
 прервите внутренний цикл и начните со следующего элемента.
 */
 if array[shifting] < array[shifting - 1] {
 array.swapAt(shifting, shifting - 1)
 } else {
 break
 }
 }
 }
 
 }
 */

public func selectionSort<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable {
    
    guard collection.count >= 2 else { return }
    
    for current in collection.indices {
        
        var lowest = current
        var other = collection.index(after: current)
        
        while other < collection.endIndex {
            
            if collection[lowest] > collection[other] {
                lowest = other
            }
            other = collection.index(after: other)
        }
        
        if lowest != current {
            collection.swapAt(lowest, current)
        }
    }
    
}
