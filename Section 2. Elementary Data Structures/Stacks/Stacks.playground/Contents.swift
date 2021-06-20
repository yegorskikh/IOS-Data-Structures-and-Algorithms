// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "using a stack") {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    
    print(stack)
    
    if let poppedValue = stack.pop() {
        assert(4 == poppedValue)
        print("Popped: \(poppedValue)")
    }
}

example(of: "initializing a stack from an array literal") {
    var stack: Stack = [1.0, 2.0, 3.0, 4.0]
    print(stack)
    stack.pop()
}

example(of: "initializing a stack from an array") {
    let array = ["A", "B", "C", "D"]
    var stack = Stack(array)
    print(stack)
    stack.pop()
}

// pop - remove last
// push - adds to the end

// MARK: - CHALLENGE

// MARK: Challenge 1

var array = [1, 2, 3, 4, 5]

func printInReverse<T>(_ array: [T]) {
    
    var stack = Stack<T>()
    
    for value in array {
        stack.push(value)
    }
    
    while let value = stack.pop() {
        print(value)
    }
    
}

printInReverse(array)

// MARK: Challenge 2

// 1
// h((e))llo(world)() - balanced parentheses

// 2
// (hello world - unbalanced parentheses

func checkParentheses(_ string: String) -> Bool {
    
    var stack = Stack<Character>()
    
    for i in string {
        
        if i == "(" {
            stack.push(i)
        } else if i == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    
    return stack.isEmpty
}

checkParentheses("h((e))llo(world)()") // true
checkParentheses("(hello world")       // false
