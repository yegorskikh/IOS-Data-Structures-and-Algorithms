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

graph.add(.undirected, from: a, to: b, weight: nil)
graph.add(.undirected, from: a, to: c, weight: nil)
graph.add(.undirected, from: a, to: d, weight: nil)
graph.add(.undirected, from: b, to: e, weight: nil)
graph.add(.undirected, from: c, to: g, weight: nil)
graph.add(.undirected, from: e, to: f, weight: nil)
graph.add(.undirected, from: e, to: h, weight: nil)
graph.add(.undirected, from: f, to: g, weight: nil)
graph.add(.undirected, from: f, to: c, weight: nil)

extension Graph where Element: Hashable {
    
    func depthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        
        var stack: Stack<Vertex<Element>> = []
        var pushed: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        
        stack.push(source)
        pushed.insert(source)
        visited.append(source)
        
        outer: while let vertex = stack.peek() {
            
            let neighbors = edges(from: vertex)
            
            guard !neighbors.isEmpty else {
                stack.pop()
                continue
            }
            
            for edge in neighbors {
                if !pushed.contains(edge.destination) {
                    stack.push(edge.destination)
                    pushed.insert(edge.destination)
                    visited.append(edge.destination)
                    continue outer
                }
            }
            stack.pop()
        }
        
        return visited
    }
}

/*
 1. Вы продолжаете проверять вершину стека на наличие вершины, пока стек не станет пустым.
    Вы пометили этот цикл как внешний, чтобы у вас был способ перейти к следующей вершине даже во вложенных циклах.
 2. Вы находите все соседние ребра для текущей вершины.
 3. Если ребер нет, вы извлекаете вершину из стека и переходите к следующей.
 4. Здесь вы перебираете каждое ребро, связанное с текущей вершиной, и проверяете,
    не была ли замечена соседняя вершина. Если нет, вы помещаете его в стек и добавляете в посещенный массив.
    Может показаться немного преждевременным отмечать эту вершину как посещенную (вы еще не смотрели на нее),
    но, поскольку вершины посещаются
 */

let vertices = graph.depthFirstSearch(from: a)
vertices.forEach { vertex in
    print(vertex)
}


