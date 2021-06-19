import Foundation

extension MutableCollection where Self: BidirectionalCollection,
                                  Element: Equatable {
    
    mutating func rightAlign(value: Element) {
        
        var left = startIndex
        var right = index(before: endIndex)
        
        while left < right {
            
            while self[right] == value {
                formIndex(before: &right)
            }
            
            while self[left] != value {
                formIndex(after: &left)
            }
            
            guard left < right else { return }
            swapAt(left, right)
        }
    }
    
}
