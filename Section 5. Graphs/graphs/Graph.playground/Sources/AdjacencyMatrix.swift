import Foundation

public class AdjacencyMatrix<T>: Graph {
    
    private var vertices: [Vertex<T>] = []
    private var weights: [[Double?]] = []
    
    public init() {}
    
    
    
    public func createVertex(data: T) -> Vertex<T> {
        
        let vertex = Vertex(index: vertices.count, data: data)
        vertices.append(vertex)
        
        for i in 0..<weights.count {
            weights[i].append(nil)
        }
        
        let row = [Double?](repeating: nil, count: vertices.count)
        weights.append(row)
        
        return vertex
    }
    
    
    
    public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        weights[source.index][destination.index] = weight
    }
    
    
    
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        
        var edges: [Edge<T>] = []
        
        for column in 0..<weights.count {
            if let weight = weights[source.index][column] {
                edges.append(Edge(source: source, destination: vertices[column], weight: weight))
            }
        }
        
        return edges
    }
    
    
    
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        weights[source.index][destination.index]
    }
    
}

extension AdjacencyMatrix: CustomStringConvertible {
    
    /*
     1. Сначала вы создаете список вершин.
     2. Затем вы строите сетку весов, ряд за рядом.
     3. Наконец, вы объединяете оба описания вместе и возвращаете их.
     */
    public var description: String {

        // 1
        let verticesDescription = vertices.map { "\($0)" }.joined(separator: "\n")

        // 2
        var grid: [String] = []
        for i in 0..<weights.count {
            var row = ""
            
            for j in 0..<weights.count {
                if let value = weights[i][j] {
                    row += "\(value)\t"
                } else {
                    row += "ø\t\t"
                }
            }
            grid.append(row)
        }
        
        // 3
        let edgesDescription = grid.joined(separator: "\n")
        
        return "\(verticesDescription)\n\n\(edgesDescription)"
    }
}
