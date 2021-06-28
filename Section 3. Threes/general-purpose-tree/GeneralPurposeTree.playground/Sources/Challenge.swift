import Foundation

func printEachLevel<T>(for tree: TreeNode<T>) {
    
    /*
     Вы начинаете с инициализации структуры данных Queue, чтобы облегчить обход порядка уровней.
     Вы также создаете nodeLeftInCurrentLevel, чтобы отслеживать количество узлов,
     с которыми вам нужно будет поработать, прежде чем печатать новую строку.
     */
    var queue = Queue<TreeNode<T>>()
    var nodesLeftInCurrentLevel = 0
    queue.enqueue(tree)
    
    /*
     Ваш обход порядка уровней продолжается до тех пор, пока ваша очередь не станет пустой.
     */
    while !queue.isEmpty {
        
        /*
         Внутри первого цикла while вы начинаете с установки для nodesLeftInCurrentLevel текущих элементов в очереди.
         */
        nodesLeftInCurrentLevel = queue.count
        
        /*
         Используя другой цикл while, вы удаляете из очереди первое количество элементов nodesLeftInCurrentLevel.
         Каждый элемент, который вы удаляете из очереди, распечатывается без создания новой строки.
         Вы также ставите в очередь всех дочерних узлов узла.
         */
        while nodesLeftInCurrentLevel > 0 {
            guard let node = queue.dequeue() else { break }
            print("\(node.value) ", terminator: "")
            node.children.forEach { queue.enqueue($0) }
            nodesLeftInCurrentLevel -= 1
        }
        /*
         На этом этапе вы создаете новую строку с помощью print ().
         В следующей итерации nodeLeftInCurrentLevel будет обновлен счетчиком очереди,
         представляющим количество дочерних элементов из предыдущей итерации.
         */
        print()
    }
}



