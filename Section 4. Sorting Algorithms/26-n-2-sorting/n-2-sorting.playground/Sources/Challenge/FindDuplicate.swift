import Foundation

extension Sequence where Element: Hashable {
    
    var firstDuplicate: Element? {
        
        var found: Set<Element> = []
        
        for value in self {
            if found.contains(value) {
                return value
            } else {
                found.insert(value)
            }
        }
        
        return nil
    }
    
}


