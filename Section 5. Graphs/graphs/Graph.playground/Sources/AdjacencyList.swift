import Foundation

public class AdjacencyList<T: Hashable>: Graph {
    
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    
    public init() {}
    
    
    
    public func createVertex(data: T) -> Vertex<T> {
        
        let vertex = Vertex(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        
        return vertex
    }
    
    
    
    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)
    }
    
    
    
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        adjacencies[source] ?? []
    }
    
    
    
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        edges(from: source).first { $0.destination == destination }?.weight
    }
    
}



extension AdjacencyList: CustomStringConvertible {
    
    /*
     1. Вы просматриваете каждую пару "ключ-значение" в смежностях.
     2. Для каждой вершины вы перебираете все ее исходящие ребра и добавляете соответствующую строку к выходным данным.
     3. Наконец, для каждой вершины вы печатаете как саму вершину, так и ее исходящие ребра.
     */
    public var description: String {
        var result = ""
        
        for (vertex, edges) in adjacencies {
            
            var edgeString = ""
            
            for (index, edge) in edges.enumerated() {
                
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            
            result.append("\(vertex) ---> [ \(edgeString) ]\n")
        }
        
        return result
    }
    
}
