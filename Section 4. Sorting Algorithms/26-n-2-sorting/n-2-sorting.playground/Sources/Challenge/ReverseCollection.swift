import Foundation

extension MutableCollection where Self: BidirectionalCollection {
    
    mutating func reverse() {
        
        var left = startIndex
        var right = index(before: endIndex)
        
        while left < right {
            swapAt(left, right)
            
            formIndex(after: &left)
            formIndex(before: &right)
        }
    }
    
}
