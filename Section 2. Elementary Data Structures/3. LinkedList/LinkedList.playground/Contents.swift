// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "creating and linking nodes") {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    
    node1.next = node2
    node2.next = node3
    
    print(node1) // 1 -> 2 -> 3
}

// Добавляет значение в начало списка
example(of: "push") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    print(list) // 1 -> 2 -> 3
}

// Добавляет значение в конец списка
example(of: "append") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    print(list) // 1 -> 2 -> 3
}

// Добавляет значение после определенного нода списка.
example(of: "inserting at a particular index") {
    
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before inserting: \(list)")
    
    var middleNode = list.node(at: 1)!
    
    for _ in 1...4 {
        middleNode = list.insert(-1, after: middleNode)
    }
    
    print("After inserting: \(list)")
}

// Удаление первого значения списка.
example(of: "pop") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before popping list: \(list)")
    
    let poppedValue = list.pop()
    print("After popping list: \(list)")
    
    print("Popped value: " + String(describing: poppedValue))
}

// Удаление последнего значения списка.
example(of: "removing the last node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    print("Before removing last node: \(list)")
    
    let removedValue = list.removeLast()
    print("After removing last node: \(list)")
    
    print("Removed value: " + String(describing: removedValue))
}

// Удаление определенного узла
example(of: "removing a node after a particular node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    print("Before removing at particular index: \(list)")
    
    let index = 1
    let node = list.node(at: index - 1)!
    let removedValue = list.remove(after: node)
    print("After removing at index \(index): \(list)")
    
    print("Removed value: " + String(describing: removedValue))
}

// Используем коллекцию
example(of: "using collection") {
    
    var list = LinkedList<Int>()
    
    for i in 0...9 {
        list.append(i)
    }
    
    print("List: \(list)")
    print("First element: \(list[list.startIndex])")
    print("Array containing first 3 elements: \(Array(list.prefix(3)))")
    print("Array containing last 3 elements: \(Array(list.suffix(3)))")
    let sum = list.reduce(0, +)
    print("Sum of all values: \(sum)")
}

example(of: "array cow") {
    let array1 = [1, 2]
    var array2 = array1
    
    print("array1: \(array1)")
    print("array2: \(array2)")
    
    print("---After adding 3 to array 2---")
    array2.append(3)
    
    print("array1: \(array1)") // array1: [1, 2]
    print("array2: \(array2)") // array2: [1, 2, 3]
}

example(of: "linked list cow") {
    
    var list1 = LinkedList<Int>()
    list1.append(1)
    list1.append(2)
    
    var list2 = list1
    
    print("List1: \(list1)")
    print("List2: \(list2)")
    
    print("After appending 3 to list2")
    list2.append(3)
    
    print("List1: \(list1)") // List1: 1 -> 2 -> 3 / COW -> / 1 -> 2
    print("List2: \(list2)") // List2: 1 -> 2 -> 3
    
    print("Removing middle node on list2")
    if let node = list2.node(at: 0) {
        list2.remove(after: node)
    }
    print("List2: \(list2)")
}

// Challenge 1: Print in reverse

example(of: "printing in reverse") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Original list: \(list)")
    print("Printing in reverse:")
    printInReverse(list)
}

// Challenge 2: Getting the middle node

example(of: "getting the middle node") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    print(list)
    
    if let middleNode = getMiddle(list) {
        print(middleNode)
    }
    
}

// Challenge 3: Reverse a linked list

example(of: "reversing a list") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Original list: \(list)")
    list.reverse()
    print("Reversed list: \(list)")
}

// Challenge 4: Merge two lists

example(of: "merging two lists") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    var anotherList = LinkedList<Int>()
    anotherList.push(-1)
    anotherList.push(-2)
    anotherList.push(-3)
    print("First list: \(list)")
    print("Second list: \(anotherList)")
    let mergedList = mergeSorted(list, anotherList)
    print("Merged list: \(mergedList)")
}

// Challenge 5: Remove all occurrences of a specific element
example(of: "deleting duplicate nodes") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(2)
    list.push(1)
    list.push(1)
    
    list.removeAll(3)
    print(list)
}
