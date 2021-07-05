import Foundation

public class Trie<CollectionType: Collection & Hashable> where CollectionType.Element: Hashable {
    public typealias Node = TrieNode<CollectionType.Element>
    
    public private(set) var collections: Set<CollectionType> = []
    
    private let root = Node(key: nil, parent: nil)
    
    public init() {}
    
    public var count: Int {
        collections.count
    }
    public var isEmpty: Bool {
        collections.isEmpty
    }
    
    public func insert(_ collection: CollectionType) {
        
        var current = root
        
        for element in collection {
            if current.children[element] == nil {
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]!
        }
        
        if current.isTerminating {
            return
        } else {
            current.isTerminating = true
            collections.insert(collection)
        }
    }
    /*
     1. current отслеживает ваш ход обхода, который начинается с корневого узла.
     2. Дерево хранит каждый элемент коллекции в отдельных узлах.
     Для каждого элемента коллекции вы сначала проверяете, существует ли в данный момент узел в дочернем словаре.
     Если этого не произошло, вы создаете новый узел. Во время каждого цикла вы перемещаете ток к следующему узлу.
     3. После прохождения цикла for ток должен ссылаться на узел, представляющий конец коллекции.
     Вы помечаете этот узел как конечный.
     */
    
    public func contains(_ collection: CollectionType) -> Bool {
        var current = root
        
        for element in collection {
            guard let child = current.children[element] else { return false }
            current = child
        }
        
        return current.isTerminating
    }
    
    public func remove(_ collection: CollectionType) {
        
        var current = root
        
        for element in collection {
            guard let child = current.children[element] else { return }
            current = child
        }
        
        guard current.isTerminating else { return }
        
        current.isTerminating = false
        
        collections.remove(collection)
        
        while let parent = current.parent,
              current.children.isEmpty && !current.isTerminating {
            parent.children[current.key!] = nil
            current = parent
        }
    }
    /*
     1. Эта часть должна показаться вам знакомой, так как в основном это реализация файла contains.
     Вы используете его здесь, чтобы проверить, является ли коллекция частью дерева,
     и указать текущий на последний узел коллекции.
     2. Вы устанавливаете для isTerminating значение false,
     чтобы текущий узел мог быть удален циклом на следующем шаге.
     3. Это сложная часть. Поскольку узлы могут быть общими, вы не хотите небрежно удалять элементы,
     принадлежащие другой коллекции. Если в текущем узле нет других дочерних элементов, это означает,
     что другие коллекции не зависят от текущего узла.
     
     Вы также проверяете, является ли текущий узел завершающим узлом.
     Если да, то он принадлежит к другой коллекции. Пока current удовлетворяет этим условиям,
     вы постоянно просматриваете родительское свойство и удаляете узлы.
     */
}

public extension Trie where CollectionType: RangeReplaceableCollection {
    
    func collections(startingWith prefix: CollectionType) -> [CollectionType] {
        
        var current = root
        
        for element in prefix {
            guard let child = current.children[element] else { return [] }
            current = child
        }
        
        return collections(startingWith: prefix, after: current)
    }
    /*
     1. Вы начинаете с проверки того, что дерево содержит префикс. В противном случае вы возвращаете пустой массив.
     2. После того, как вы нашли узел, который отмечает конец префикса,
     вы вызываете рекурсивный вспомогательный метод collection (startWith: after :),
     чтобы найти все последовательности после текущего узла.
     */
    
    
    private func collections(startingWith prefix: CollectionType, after node: Node) -> [CollectionType] {
        
        var results: [CollectionType] = []
        
        if node.isTerminating {
            results.append(prefix)
        }
        
        for child in node.children.values {
            var prefix = prefix
            prefix.append(child.key!)
            results.append(contentsOf: collections(startingWith: prefix, after: child))
        }
        
        return results
    }
    /*
     1. Вы создаете массив для хранения результатов. Если текущий узел является конечным, вы добавляете его к результатам.
     2. Затем вам нужно проверить дочерние элементы текущего узла.
     Для каждого дочернего узла вы рекурсивно вызываете коллекции (startWith: after :)
     для поиска других конечных узлов.
     */
    
}
