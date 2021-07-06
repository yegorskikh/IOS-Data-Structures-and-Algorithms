// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

// TESTING

var priorityQueue = PriorityQueue(sort: >, elements: [1,12,3,4,1,6,8,7])

while !priorityQueue.isEmpty {
    print(priorityQueue.dequeue()!)
}
