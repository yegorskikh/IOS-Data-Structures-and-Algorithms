// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

// Lomuto’s partitioning
var list = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
quicksortLomuto(&list,
                low: 0,
                high: list.count - 1)
print(list) // [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]



// Hoare’s partitioning
var list2 = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
quicksortHoare(&list2,
               low: 0,
               high: list.count - 1)
print(list2) // [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]



// Sort Median
var list3 = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
quickSortMedian(&list3,
                low: 0,
                high: list3.count - 1)
print(list3) // [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]


// Dutch Flag
var list4 = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
quicksortDutchFlag(&list4,
                   low: 0,
                   high: list4.count - 1)
print(list4) // [-1, 0, 1, 2, 3, 5, 8, 8, 9, 12, 18, 21, 27]



// Challenges

// 1. Iterative Quicksort

var list5 = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
quicksortIterativeLomuto(&list5, low: 0, high: list.count - 1)
print(list5)


// 2. Merge Sort or Quicksort
/*
 
 - Сортировка слиянием предпочтительнее быстрой сортировки, когда вам нужна стабильность. Сортировка слиянием
 является стабильной сортировкой и гарантирует _O _ (_ n_ log _n_). Это не так с
 быстрая сортировка, которая нестабильна и может работать так же плохо, как _O _ (_ n²_).
 
 - Сортировка слиянием лучше работает для больших структур данных или структур данных, где
 элементы разбросаны по памяти. Быстрая сортировка лучше всего работает, когда элементы
 хранятся в непрерывном блоке.
 
 */

// 3.  Partitioning with Swift Standard Library

/*
 Implement Quicksort using the partition(by:) function that is part of the Swift Standard Library.

 For more information refer to Apple's documentation here:
 https://developer.apple.com/documentation/swift/array/3017524-partition
 */

var numbers = [12, 0, 3, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]
print(numbers)
numbers.quicksort()
print(numbers)
