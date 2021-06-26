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
