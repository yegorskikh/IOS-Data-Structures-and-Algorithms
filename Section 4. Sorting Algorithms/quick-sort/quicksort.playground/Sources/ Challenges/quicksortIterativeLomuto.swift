import Foundation

public func quicksortIterativeLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    
    var stack = Stack<Int>()
    stack.push(low)
    stack.push(high)
    
    while !stack.isEmpty {
        
        guard
            let end = stack.pop(),
            let start = stack.pop()
        else {
            continue
        }
        
        let p = partitionLomuto(&a, low: start, high: end)
        
        if (p - 1) > start {
            stack.push(start)
            stack.push(p - 1)
        }
        
        if (p + 1) < end {
            stack.push(p + 1)
            stack.push(end)
        }
    }
}
