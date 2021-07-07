// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

//: ![sampleGraph](sampleGraph.png)

let graph = AdjacencyList<String>()

let a = graph.createVertex(data: "A")
let b = graph.createVertex(data: "B")
let c = graph.createVertex(data: "C")
let d = graph.createVertex(data: "D")
let e = graph.createVertex(data: "E")
let f = graph.createVertex(data: "F")
let g = graph.createVertex(data: "G")
let h = graph.createVertex(data: "H")

graph.add(.directed, from: a, to: b, weight: 8)
graph.add(.directed, from: a, to: f, weight: 9)
graph.add(.directed, from: a, to: g, weight: 1)
graph.add(.directed, from: b, to: f, weight: 3)
graph.add(.directed, from: b, to: e, weight: 1)
graph.add(.directed, from: f, to: a, weight: 2)
graph.add(.directed, from: h, to: f, weight: 2)
graph.add(.directed, from: h, to: g, weight: 5)
graph.add(.directed, from: g, to: c, weight: 3)
graph.add(.directed, from: c, to: e, weight: 1)
graph.add(.directed, from: c, to: b, weight: 3)
graph.add(.undirected, from: e, to: c, weight: 8)
graph.add(.directed, from: e, to: b, weight: 1)
graph.add(.directed, from: e, to: d, weight: 2)

let dijkstra = Dijkstra(graph: graph)
let pathsFromA = dijkstra.shortestPath(from: a)
let path = dijkstra.shortestPath(to: d, paths: pathsFromA)

for edge in path {
  print("\(edge.source) --|\(edge.weight ?? 0.0)|--> \(edge.destination)")
}

// Challenge 2

let graph2 = AdjacencyList<String>()

let aa = graph2.createVertex(data: "A")
let bb = graph2.createVertex(data: "B")
let cc = graph2.createVertex(data: "C")
let dd = graph2.createVertex(data: "D")
let ee = graph2.createVertex(data: "E")

graph2.add(.directed, from: aa, to: bb, weight: 1)
graph2.add(.directed, from: aa, to: ee, weight: 21)
graph2.add(.directed, from: aa, to: cc, weight: 12)
graph2.add(.directed, from: bb, to: dd, weight: 9)
graph2.add(.directed, from: bb, to: cc, weight: 8)
graph2.add(.directed, from: dd, to: ee, weight: 2)
graph2.add(.directed, from: cc, to: ee, weight: 2)

print(graph2)

let dijkstra2 = Dijkstra(graph: graph2)
let pathsDict2 = dijkstra2.getAllShortestPath(from: aa)

for (vertex, path) in pathsDict2 {
    
  print("Path to \(vertex) from \(a)")
  for edge in path {
    print("\(edge.source) --|\(edge.weight ?? 0.0)|--> \(edge.destination)")
  }
  print("\n")
}
