// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "bubble sort") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)") // [9, 4, 10, 3]
    bubbleSort(&array)
    print("Bubble sorted: \(array)") // [3, 4, 9, 10]
}

example(of: "selection sort") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)") // [9, 4, 10, 3]
    selectionSort(&array)
    print("Selection sorted: \(array)") // [3, 4, 9, 10]
}

example(of: "insertion sort") {
    var array = [9, 4, 10, 3] // [9, 4, 10, 3]
    print("Original: \(array)")
    insertionSort(&array)
    print("Insertion sorted: \(array)") // [3, 4, 9, 10]
}



