// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

example(of: "Extension Binary Search") {
    
    let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]

    let search31 = array.firstIndex(of: 31)
    let binarySearch31 = array.binarySearch(for: 31)

    print("firstIndex(of:): \(String(describing: search31))")
    print("binarySearch(for:): \(String(describing: binarySearch31))")
    
}


example(of: "Binary Search") {
    
    let array = [1, 2, 10, 43, 55, 60, 150, 1420]
    binarySearch(for: 10, in: array) == 2
    
}


example(of: "Searching for a range") {
    
    let array = [1, 2, 3, 3, 3, 4, 5, 5]
    
    if let indices = findIndices(of: 3, in: array) {
      print(indices)
    }
    
}
