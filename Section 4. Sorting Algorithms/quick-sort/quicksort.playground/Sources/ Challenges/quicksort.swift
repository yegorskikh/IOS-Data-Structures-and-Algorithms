import Foundation

extension MutableCollection where Self: BidirectionalCollection, Element: Comparable {

  mutating func quicksort() {
    quicksortLumuto(low: startIndex, high: index(before: endIndex))
  }

  private mutating func quicksortLumuto(low: Index, high: Index) {
    
    if low <= high {
        
      let pivotValue = self[high]
      var p = self.partition { $0 > pivotValue }

      if p == endIndex {
        p = index(before: p)
      }
        
      self[..<p].quicksortLumuto(low: low, high: index(before: p))
      self[p...].quicksortLumuto(low: index(after: p), high: high)
    }
  }
    
}


