import Foundation
/*
 public func selectionSort<Element>(_ array: inout [Element]) where Element: Comparable {
 
 guard array.count >= 2 else { return }
 
 /* Вы выполняете проход для каждого элемента в коллекции, кроме последнего.
 Нет необходимости включать последний элемент, поскольку,
 если все остальные элементы находятся в правильном порядке, последний будет также.
 */
 for current in 0..<(array.count - 1) {
 var lowest = current
 
 /*
 На каждом проходе вы просматриваете оставшуюся часть коллекции, чтобы найти элемент с наименьшим значением.
 */
 for other in (current + 1)..<array.count {
 if array[lowest] > array[other] {
 lowest = other
 }
 }
 
 // Если этот элемент не является текущим элементом, поменяйте их местами.
 if lowest != current {
 array.swapAt(lowest, current)
 }
 }
 }
 */

public func insertionSort<T>(_ collection: inout T) where T: BidirectionalCollection & MutableCollection,
                                                          T.Element: Comparable {
    
    guard collection.count >= 2 else { return }
    
    for current in collection.indices {
        
        var shifting = current
        
        while shifting > collection.startIndex {
            
            let previous = collection.index(before: shifting)
            
            if collection[shifting] < collection[previous] {
                collection.swapAt(shifting, previous)
            } else {
                break
            }
            
            shifting = previous
        }
    }
    
}
