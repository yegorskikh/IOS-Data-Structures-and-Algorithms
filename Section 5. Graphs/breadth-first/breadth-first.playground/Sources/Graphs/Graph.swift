// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public enum EdgeType {
    
    case directed
    case undirected
}

public protocol Graph {
    
    associatedtype Element
    
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
}

extension Graph {
    
    public func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    public func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
    
}

extension Graph where Element: Hashable {
    
    func bfs(from source: Vertex<Element>) -> [Vertex<Element>] {
        var queue = QueueStack<Vertex<Element>>()
        var enqueued: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        
        queue.enqueue(source)
        enqueued.insert(source)
        
        bfs(queue: &queue, enqueued: &enqueued, visited: &visited)
        return visited
    }
    
    private func bfs(queue: inout QueueStack<Vertex<Element>>,
                     enqueued: inout Set<Vertex<Element>>,
                     visited: inout [Vertex<Element>]) {
        guard let vertex = queue.dequeue() else {
            return
        }
        visited.append(vertex)
        let neighborEdges = edges(from: vertex)
        neighborEdges.forEach { edge in
            if !enqueued.contains(edge.destination) {
                queue.enqueue(edge.destination)
                enqueued.insert(edge.destination)
            }
        }
        bfs(queue: &queue, enqueued: &enqueued, visited: &visited)
    }
    
}

extension Graph where Element: Hashable {
    
    func breadthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        var queue = QueueStack<Vertex<Element>>()
        var enqueued: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        
        queue.enqueue(source)
        enqueued.insert(source)
        
        while let vertex = queue.dequeue() {
            visited.append(vertex)
            let neighborEdges = edges(from: vertex)
            neighborEdges.forEach { edge in
                if !enqueued.contains(edge.destination) {
                    queue.enqueue(edge.destination)
                    enqueued.insert(edge.destination)
                }
            }
        }
        
        return visited
    }
}

extension Graph where Element: Hashable {
    
    func isDisconnected() -> Bool {
        
        guard let firstVertex = allVertices.first else {
            return false
        }
        
        let visited = breadthFirstSearch(from: firstVertex)
        for vertex in allVertices {
            if !visited.contains(vertex) {
                return true
            }
        }
        return false
    }
    
}
