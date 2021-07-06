# IOS-Data-Structures-and-Algorithms
## Table of Contents: Overview

> Section I: Introduction
* [**Complexity**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#complexity)
* [**Set, Dictionary, Array**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#set-dictionary-array)
<br> </br>

> Section II: Elementary Data Structures
* [**Stack**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#stack) 
* [**LinkedList**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#linkedlist)
* [**Queues**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#queues)
<br> </br>

> Section III: Trees
- [**Trees**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#three)
- [**Binary Trees**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#binary-trees)
- [**Binary Search Trees**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#binary-search-trees)
- [**AVL Trees**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#avl-trees)
- [**Tries**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/README.md#tries)
- [**Binary Search**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#binary-search)
- [**The Heap Data Structure**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#the-heap-data-structure)
- Priority Queue
<br> </br>

> Section IV: Sorting Algorithms
- [**O(n2) Sorting Algorithms**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#on2-sorting)
- [**Merge Sort**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#merge-sort)
- [**Radix Sort**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/README.md#radix-sort)
- [**Heap Sort**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/README.md#heap-sort)
- [**Quick Sort**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/README.md#quick-sort)
<br> </br>

> Section V: Graphs
- Graphs
- Breadth-First Search
- Depth-First Search
- Dijkstra’s Algorithm
- Prim’s Algorithm
<br> </br>

## Table of Contents: Extended
## **Complexity**
### Key points
 - [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%201.%20Introduction/1.%20Complexity/Complexity.swift)
* Сложность времени - это мера времени, необходимого для запуска алгоритма при увеличении размера входных данных.
* Вы должны знать о постоянном времени, логарифмическом времени, линейном времени, квазилинейном времени и квадратичном времени и уметь упорядочивать их по стоимости.
* Сложность пространства - это мера ресурсов, необходимых для работы алгоритма.
* Обозначение Big O используется для представления общей формы временной и пространственной сложности.
* Сложность во времени и пространстве - это высокоуровневые меры масштабируемости; они не измеряют фактическую скорость самого алгоритма.
* Для небольших наборов данных временная сложность обычно не имеет значения. Квазилинейный алгоритм может быть медленнее линейного алгоритма.
<br> </br>

## **Set, Dictionary, Array**
### Key points
* Такие функции, как insert (at :) для Array, обладают характеристиками производительности, которые могут снизить производительность при случайном использовании. Если вам нужно часто использовать insert (at :) с индексами в начале массива, вы можете рассмотреть другую структуру данных, такую как связанный список.
* Dictionary лишен возможности поддерживать порядок своих элементов для быстрой вставки и поиска.
* Set гарантирует уникальность набора значений. Набор оптимизирован по скорости и лишен возможности сохранять порядок элементов.
<br> </br>

## **Stack**
### Key points
- [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%202.%20Elementary%20Data%20Structures/2.%20Stacks/Stacks.playground/Sources/Stack.swift)
* Стек - это структура данных LIFO, принцип «последний пришел - первый ушел».
* Несмотря на свою простоту, стек является ключевой структурой данных для многих проблем.
* Единственные две важные операции для стека - это метод push для добавления элементов и метод pop для удаления элементов.
<br> </br>

## **LinkedList** 
### Key points
 - [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%202.%20Elementary%20Data%20Structures/3.%20LinkedList/LinkedList.playground/Sources/LinkedList.swift)
* Связанные списки бывают линейными и однонаправленными. Как только вы переместите ссылку с одного узла на другой, вы не сможете вернуться назад.
* Связанные списки имеют временную сложность O (1) для вставки заголовком. Массивы имеют временную сложность O (n) для вставок заголовком.
* Соответствие протоколам сбора Swift, таким как Sequence и Collection, предлагает множество полезных методов для довольно небольшого количества требований.
* Поведение копирования при записи позволяет достичь семантики значения.
<br> </br>

## **Queues**
### Key points
 - [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%202.%20Elementary%20Data%20Structures/4.%20Queues/Queue.playground/Sources/Queue.swift)
* Очередь использует стратегию FIFO, элемент, добавленный первым, также должен быть сначала удален.
* Enqueue вставляет элемент в конец очереди.
* Dequeue удаляет элемент в начале очереди.
* Элементы в массиве размещаются в непрерывных блоках памяти, тогда как элементы в связанном списке более разбросаны, что может привести к промахам в кэше.
* Реализация на основе кольцевой буферной очереди хороша для очередей с фиксированным размером.
* По сравнению с другими структурами данных, использование двух стеков улучшает
dequeue (_ :) временная сложность до амортизированной операции O (1).
* Реализация двойного стека превосходит Linked-list с точки зрения пространственной локализации.
<br> </br>

## **Three**
### Key points
- [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/tree/main/Section%203.%20Threes/10-general-purpose-tree/GeneralPurposeTree.playground)
* Деревья имеют некоторое сходство со связанными списками, но, в то время как узлы
связанного списка могут связываться только с одним узлом-преемником, узел дерева может связываться со многими дочерними узлами.
* Каждый узел дерева, кроме корневого, имеет ровно один родительский узел.
* У корневого узла нет родительских узлов.
* Листовые узлы не имеют дочерних узлов.
* Хорошо разбирайтесь в терминологии дерева, такой как родительский, дочерний, листовой и корневой. Многие из этих терминов являются общим языком для коллег-программистов и будут использоваться для объяснения других древовидных структур.
* Обходы, такие как обходы в глубину и в порядке уровней, не относятся к общему дереву. Они работают и с другими деревьями, хотя их реализация будет немного отличаться в зависимости от структуры дерева.
<br> </br>

## **Binary Trees**
### Key points
- [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/tree/main/Section%203.%20Threes/binary-tree/BinaryTrees.playground)
- Бинарное дерево является основой некоторых из наиболее важных древовидных структур. Дерево двоичного поиска и дерево AVL - это двоичные деревья, которые накладывают ограничения на поведение при вставке / удалении.
- Обходы по порядку, по порядку и после по порядку важны не только для двоичного дерева; если вы обрабатываете данные в каком-либо дереве, вы будете регулярно использовать эти обходы.
<br> </br>

## **Binary Search Trees**
### Key points
- [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%203.%20Threes/binary-search-tree/BinarySearchTree.playground/Sources/BinarySearchTree.swift)
- Дерево двоичного поиска - это мощная структура данных для хранения отсортированных данных.
- Элементы двоичного дерева поиска должны быть сопоставимы. Этого можно достичь, используя
общее ограничение или путем предоставления замыканий для сравнения.
- Сложность по времени для методов insert, remove и contains в BST равна O (log
п).
• Производительность снизится до O(n), поскольку дерево станет несбалансированным. Это нежелательно, поэтому вы узнаете о самобалансирующемся двоичном дереве поиска, называемом деревом AVL.
<br> </br>

## **AVL Trees**
### Key points
- [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/tree/main/Section%203.%20Threes/avl-tree/avl-tree.playground)
- Самобалансирующееся дерево позволяет избежать снижения производительности за счет выполнения процедуры балансировки всякий раз, когда вы добавляете или удаляете элементы в дереве.
- Деревья AVL сохраняют баланс за счет корректировки частей дерева, когда дерево больше не сбалансировано.
- Баланс достигается четырьмя типами вращения дерева при вставке и удалении узла.
<br> </br>

## **Tries**
### Key points
- [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/tree/main/Section%203.%20Threes/tries/Trie.playground)
- **Tries** обеспечивают отличные показатели производительности в отношении сопоставления префиксов.
- **Tries** относительно эффективны с точки зрения памяти, поскольку отдельные узлы могут использоваться несколькими разными значениями. Например, первые три буквы слова могут быть одинаковыми для слов «car», «carbs» и «care».
<br> </br>

## **Binary Search**
### Key points
- [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%203.%20Threes/binary-search/BinarySearch.playground/Sources/BinarySearch.swift)
- Binary search - алгоритм **работает** только для отсортированных коллекций.
- Иногда может быть полезно отсортировать коллекцию только для того, чтобы использовать возможности **двоичного поиска** для поиска элементов.
- Метод firstIndex (of :) для последовательностей использует линейный поиск с временной сложностью O (n). Бинарный поиск имеет временную сложность O (log n), которая намного лучше масштабируется для больших наборов данных, если вы выполняете повторяющиеся поиски.
<br> </br>

## **The Heap Data Structure**
### Key points
- [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%203.%20Threes/heap/heap.playground/Sources/Heap.swift)
- Структура данных кучи хороша для поддержания элемента с наивысшим или самым низким приоритетом.
- Каждый раз, когда вы вставляете или удаляете элементы из кучи, вы должны проверять, удовлетворяет ли он правилам приоритета.
- Вот сводка алгоритмической сложности операций с кучей, которые вы реализовали в этой главе:

| Operations | Time Complexity | 
| ------------- | ------------- | 
| remove | O(log n) | 
| insert | O(log n) |
| search | O(n) | 
| peak | O(1) |

<br> </br>

## **Priority Queue**
### Key points
<br> </br>

## **O(n2) Sorting**
### Key points
- [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/tree/main/Section%204.%20Sorting%20Algorithms/26-n-2-sorting/n-2-sorting.playground)
- Алгоритмы n2 часто имеют плохую репутацию, но некоторые из этих алгоритмов обычно имеют определенные преимущества. InsertSort может выполнять сортировку за O (n) раз, если коллекция уже отсортирована, и постепенно уменьшается до O (n2).
- InsertSort - один из лучших способов сортировки в ситуациях, когда вы заранее знаете, что ваши данные в основном находятся в отсортированном порядке.
<br> </br>
## **Merge Sort**
### Key points
- [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/tree/main/Section%204.%20Sorting%20Algorithms/merge-sort/merge-sort.playground)
- Сортировка слиянием относится к категории алгоритмов «разделяй и властвуй».
- Существует множество реализаций сортировки слиянием, и вы можете иметь разные характеристики производительности в зависимости от реализации.
<br> </br>

## **Radix Sort**
### Key points
- [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/tree/main/Section%204.%20Sorting%20Algorithms/radix-sort/RadixSort.playground)
- Радиксная сортировка - это несравнительная сортировка, которая не основывается на сравнении двух значений. Сортировка Radix использует сегментную сортировку, которая похожа на решето для фильтрации значений. Полезная аналогия - это то, как некоторые торговые автоматы принимают монеты - монеты различаются по размеру.
- Radix sort может быть одним из самых быстрых алгоритмов сортировки для сортировки значений с позиционным обозначением.
- В этой главе описана сортировка по основанию счисления младших разрядов. Другой способ реализовать сортировку по системе счисления - это форма старших цифр. Эта форма сортирует, отдавая приоритет наиболее значимым цифрам над меньшими, и лучше всего иллюстрируется поведением сортировки типа String.
<br> </br>

## **Heap Sort**
### Key points
- [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/tree/main/Section%204.%20Sorting%20Algorithms/heap-sort/HeapSort.playground)
- Сортировка кучи использует структуру данных max-heap(максимальной кучи) для сортировки элементов в массиве.
<br> </br>

## **Quick Sort**
### Key points
- [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/tree/main/Section%204.%20Sorting%20Algorithms/quick-sort/quicksort.playground)
- Наивное разбиение создает новый массив для каждой функции фильтра; это неэффективно. Все остальные стратегии действуют.
- При разбиении Lomuto’s последний элемент выбирается в качестве опорного.
- При разбиении Hoare’s в качестве стержня выбирается первый элемент.
- Идеальная опора могла бы равномерно разделить элементы между перегородками.
- Выбор плохого поворота может привести к выполнению быстрой сортировки за O(n2).
- Median of three находит точку поворота, беря медианы первого, среднего и последнего элементов.
- Стратегия разделения голландского национального флага помогает более эффективно организовать повторяющиеся элементы.

## **Graphs**
### Key points
<br> </br>
## **Breadth-First Search**
### Key points
<br> </br>
## **Depth-First Search**
### Key points
<br> </br>
## **Dijkstra’s Algorithm**
### Key points
<br> </br>
## **Prim’s Algorithm**
### Key points
