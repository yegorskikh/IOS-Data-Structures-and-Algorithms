import Foundation

public class TrieNode<Key: Hashable> {
    
    public var key: Key?
    public weak var parent: TrieNode?
    public var children: [Key: TrieNode] = [:]
    public var isTerminating = false
    
    /*
     1. Key содержит данные для узла. Это необязательно, потому что у корневого узла дерева нет ключа.
     2. TrieNode содержит слабую ссылку на своего родителя. Эта ссылка упрощает метод удаления позже.
     3. В деревьях двоичного поиска у узлов есть левый и правый дочерние элементы.
        В дереве узел должен содержать несколько разных элементов. Вы объявили дочерний словарь, чтобы помочь с этим.
     4. isTerminating действует как индикатор конца коллекции.
     */
    
    public init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
}
