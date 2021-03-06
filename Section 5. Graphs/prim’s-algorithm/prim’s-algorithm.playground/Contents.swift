// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

var graph = AdjacencyList<Int>()
let one = graph.createVertex(data: 1)
let two = graph.createVertex(data: 2)
let three = graph.createVertex(data: 3)
let four = graph.createVertex(data: 4)
let five = graph.createVertex(data: 5)
let six = graph.createVertex(data: 6)

graph.add(.undirected, from: one, to: two, weight: 6)
graph.add(.undirected, from: one, to: three, weight: 1)
graph.add(.undirected, from: one, to: four, weight: 5)
graph.add(.undirected, from: two, to: three, weight: 5)
graph.add(.undirected, from: two, to: five, weight: 3)
graph.add(.undirected, from: three, to: four, weight: 5)
graph.add(.undirected, from: three, to: five, weight: 6)
graph.add(.undirected, from: three, to: six, weight: 4)
graph.add(.undirected, from: four, to: six, weight: 2)
graph.add(.undirected, from: five, to: six, weight: 6)

print(graph)

let (cost,mst) = Prim().produceMinimumSpanningTree(for: graph)
print("cost: \(cost)")
print("mst:")
print(mst)


// CHALLENGE

import UIKit

extension CGPoint: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
    
}

extension CGPoint {
    
    func distanceSquared(to point: CGPoint) -> CGFloat {
        let xDistance = (x - point.x)
        let yDistance = (y - point.y)
        return xDistance * xDistance + yDistance * yDistance
    }
    
    func distance(to point: CGPoint) -> CGFloat {
        distanceSquared(to: point).squareRoot()
    }
    
}

extension Prim where T == CGPoint {
    
    public func createCompleteGraph(with points: [CGPoint]) -> Graph {
        let completeGraph = Graph()
        
        // Convert the set of points to vertices
        points.forEach { point in
            completeGraph.createVertex(data: point)
        }
        
        // Create an edge between every vertex, and calculate the distance (weight)
        // from point to point.
        completeGraph.vertices.forEach { currentVertex in
            completeGraph.vertices.forEach { vertex in
                if currentVertex != vertex {
                    let distance = Double(currentVertex.data.distance(to: vertex.data))
                    completeGraph.addDirectedEdge(from: currentVertex, to: vertex, weight: distance)
                }
            }
        }
        
        return completeGraph
    }
    
    public func produceMinimumSpanningTree(with points: [CGPoint]) -> (cost: Double, mst: Graph) {
        let completeGraph = createCompleteGraph(with: points)
        return produceMinimumSpanningTree(for: completeGraph)
    }
}

// Interested in trying out other points?
func generateRandomPoints(count: Int, range: Range<CGFloat>) -> [CGPoint] {
    (1...count).map { _ in
        CGPoint(x: CGFloat.random(in: range), y: CGFloat.random(in: range))
    }
}

// You can plot your points using the following:
// Copy and paste the follow points into `desmos`
// (4.0, 0.0), (6.0, 16.0), (10.0, 1.0), (3.0, 17.0), (18.0, 7.0), (5.0, 14.0)
//https://www.desmos.com/calculator

let points = [CGPoint(x: 4, y: 0), // 0
              CGPoint(x: 6, y: 16), // 1
              CGPoint(x: 10, y: 1), // 2
              CGPoint(x: 3, y: 17), // 3
              CGPoint(x: 18, y: 7), // 4
              CGPoint(x: 5, y: 14)] // 5

let (cost,mst) = Prim().produceMinimumSpanningTree(with: points)

print(mst)
print(cost)
