# IOS-Data-Structures-and-Algorithms

<p align='center'>
This repository was written based on this book.
<p align='center'>
</p>
<p align='center'>
 <a href='https://www.raywenderlich.com/books/data-structures-algorithms-in-swift' target="_blank">
    <img src="https://img.shields.io/badge/Data Structures and Algorithms-9cf"/>
<p align='center'>
</p>

## Table of Contents: Overview

> Section I: Introduction
- [**Complexity**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#complexity)
- [**Set, Dictionary, Array**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#set-dictionary-array)
<br> </br>

> Section II: Elementary Data Structures
- [**Stack**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#stack) 
- [**LinkedList**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#linkedlist)
- [**Queues**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#queues)
<br> </br>

> Section III: Trees
- [**Trees**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#three)
- [**Binary Trees**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#binary-trees)
- [**Binary Search Trees**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#binary-search-trees)
- [**AVL Trees**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#avl-trees)
- [**Tries**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/README.md#tries)
- [**Binary Search**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#binary-search)
- [**The Heap Data Structure**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#the-heap-data-structure)
- [**Priority Queue**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#priority-queue)
<br> </br>

> Section IV: Sorting Algorithms
- [**O(n2) Sorting Algorithms**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#on2-sorting)
- [**Merge Sort**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#merge-sort)
- [**Radix Sort**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/README.md#radix-sort)
- [**Heap Sort**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/README.md#heap-sort)
- [**Quick Sort**](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/README.md#quick-sort)
<br> </br>

> Section V: Graphs
- [Graphs](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms#graphs)
- Breadth-First Search
- Depth-First Search
- Dijkstra’s Algorithm
- Prim’s Algorithm
<br> </br>

## Table of Contents: Extended
## **Complexity**
### Key points
- [implementation](https://github.com/egorskikh/https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%201.%20Introduction/Complexity/Complexity.swift)
- Сложность времени - это мера времени, необходимого для запуска алгоритма при увеличении размера входных данных.
- Вы должны знать о постоянном времени, логарифмическом времени, линейном времени, квазилинейном времени и квадратичном времени и уметь упорядочивать их по стоимости.
- Сложность пространства - это мера ресурсов, необходимых для работы алгоритма.
- Обозначение Big O используется для представления общей формы временной и пространственной сложности.
- Сложность во времени и пространстве - это высокоуровневые меры масштабируемости; они не измеряют фактическую скорость самого алгоритма.
- Для небольших наборов данных временная сложность обычно не имеет значения. Квазилинейный алгоритм может быть медленнее линейного алгоритма.
<br> </br>

## **Set, Dictionary, Array**
### Key points
- Такие функции, как **insert(at :)** для Array, обладают характеристиками производительности, которые могут снизить производительность при случайном использовании. Если вам нужно часто использовать **insert(at :)** с индексами в начале массива, вы можете рассмотреть другую структуру данных, такую как связанный список.
- Dictionary лишен возможности поддерживать порядок своих элементов для быстрой вставки и поиска.
- Set гарантирует уникальность набора значений. Набор оптимизирован по скорости и лишен возможности сохранять порядок элементов.
<br> </br>

## **Stack**
### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%202.%20Elementary%20Data%20Structures/Stacks/Stacks.playground/Sources/Stack.swift)
* Стек - это структура данных **LIFO**, принцип «последний пришел - первый ушел».
* Несмотря на свою простоту, стек является ключевой структурой данных для многих проблем.
* Единственные две важные операции для стека - это метод **push** для добавления элементов и метод **pop** для удаления элементов.
<br> </br>

## **LinkedList** 
### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%202.%20Elementary%20Data%20Structures/LinkedList/LinkedList.playground/Sources/LinkedList.swift)
- Связанные списки бывают линейными и однонаправленными. Как только вы переместите ссылку с одного узла на другой, вы не сможете вернуться назад.
- Связанные списки имеют временную сложность **O(1)** для вставки заголовком. Массивы имеют временную сложность O (n) для вставок заголовком.
- Соответствие протоколам сбора Swift, таким как **Sequence** и **Collection**, предлагает множество полезных методов для довольно небольшого количества требований.
- Поведение копирования при записи позволяет достичь семантики значения.
<br> </br>

## **Queues**
### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/tree/main/Section%202.%20Elementary%20Data%20Structures/Queues/Queue.playground/Pages)
- Очередь использует стратегию **FIFO**, элемент, добавленный первым, также должен быть сначала удален.
- **Enqueue** вставляет элемент в конец очереди.
- **Dequeue** удаляет элемент в начале очереди.
- Элементы в массиве размещаются в непрерывных блоках памяти, тогда как элементы в связанном списке более разбросаны, что может привести к промахам в кэше.
- Реализация на основе кольцевой буферной очереди хороша для очередей с фиксированным размером.
- По сравнению с другими структурами данных, использование двух стеков улучшает
**dequeue(_ :)** временная сложность до амортизированной операции **O(1)**.
- Реализация двойного стека превосходит Linked-list с точки зрения пространственной локализации.
<br> </br>

## **Three**
### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%203.%20Threes/general-purpose-tree/GeneralPurposeTree.playground/Sources/TreeNode.swift)
- Деревья имеют некоторое сходство со связанными списками, но, в то время как узлы
связанного списка могут связываться только с одним узлом-преемником, узел дерева может связываться со многими дочерними узлами.
- Каждый узел дерева, кроме корневого, имеет ровно один родительский узел.
- У корневого узла нет родительских узлов.
- Листовые узлы не имеют дочерних узлов.
- Хорошо разбирайтесь в терминологии дерева, такой как родительский, дочерний, листовой и корневой. Многие из этих терминов являются общим языком для коллег-программистов и будут использоваться для объяснения других древовидных структур.
- Обходы, такие как обходы в глубину и в порядке уровней, не относятся к общему дереву. Они работают и с другими деревьями, хотя их реализация будет немного отличаться в зависимости от структуры дерева.
<br> </br>

## **Binary Trees**
### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%203.%20Threes/binary-tree/BinaryTrees.playground/Sources/BinaryNode.swift)
- Бинарное дерево является основой некоторых из наиболее важных древовидных структур. Дерево двоичного поиска и дерево AVL - это двоичные деревья, которые накладывают ограничения на поведение при вставке/удалении.
- Обходы по порядку, по порядку и после по порядку важны не только для двоичного дерева; если вы обрабатываете данные в каком-либо дереве, вы будете регулярно использовать эти обходы.
<br> </br>

## **Binary Search Trees**
### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%203.%20Threes/binary-search/BinarySearch.playground/Sources/BinarySearch.swift)
- Дерево двоичного поиска - это мощная структура данных для хранения отсортированных данных.
- Элементы двоичного дерева поиска должны быть сопоставимы. Этого можно достичь, используя
общее ограничение или путем предоставления замыканий для сравнения.
- Сложность по времени для методов **insert**, **remove** и **contains** в BST равна **O(log п)**.
- Производительность снизится до **O(n)**, поскольку дерево станет несбалансированным. Это нежелательно, поэтому вы узнаете о самобалансирующемся двоичном дереве поиска, называемом деревом AVL.
<br> </br>

## **AVL Trees**
### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%203.%20Threes/avl-tree/avl-tree.playground/Sources/AVLTree.swift)
- Самобалансирующееся дерево позволяет избежать снижения производительности за счет выполнения процедуры балансировки всякий раз, когда вы добавляете или удаляете элементы в дереве.
- Деревья AVL сохраняют баланс за счет корректировки частей дерева, когда дерево больше не сбалансировано.
- Баланс достигается четырьмя типами вращения дерева при вставке и удалении узла.
<br> </br>

## **Tries**
### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%203.%20Threes/tries/Trie.playground/Sources/Trie.swift)
- **Tries** обеспечивают отличные показатели производительности в отношении сопоставления префиксов.
- **Tries** относительно эффективны с точки зрения памяти, поскольку отдельные узлы могут использоваться несколькими разными значениями. Например, первые три буквы слова могут быть одинаковыми для слов «car», «carbs» и «care».
<br> </br>

## **Binary Search**
### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%203.%20Threes/binary-search/BinarySearch.playground/Sources/BinarySearch.swift)
- **Binary search** - алгоритм работает только для отсортированных коллекций.
- Иногда может быть полезно отсортировать коллекцию только для того, чтобы использовать возможности **двоичного поиска** для поиска элементов.
- Метод **firstIndex(of :)** для последовательностей использует линейный поиск с временной сложностью **O(n)**. Бинарный поиск имеет временную сложность **O(log n)**, которая намного лучше масштабируется для больших наборов данных, если вы выполняете повторяющиеся поиски.
<br> </br>

## **The Heap Data Structure**

Вот сводка алгоритмической сложности операций с кучей, которые мы реализовали в этой главе:

| Operations | Time Complexity | 
| ------------- | ------------- | 
| remove | **O(log n)** | 
| insert | **O(log n)** |
| search | **O(n)** | 
| peak | **O(1)** |

### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%203.%20Threes/heap/heap.playground/Sources/Heap.swift)
- Структура данных кучи хороша для поддержания элемента с наивысшим или самым низким приоритетом.
- Каждый раз, когда вы вставляете или удаляете элементы из кучи, вы должны проверять, удовлетворяет ли он правилам приоритета.

<br> </br>

## **Priority Queue**
### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%203.%20Threes/priority-queue/PriorityQueue.playground/Sources/PriorityQueue.swift)
- Очередь с приоритетом часто используется для поиска элемента в порядке приоритета.
- Он создает уровень абстракции, фокусируясь на ключевых операциях очереди и
исключая дополнительные функции, предоставляемые структурой данных кучи.
- Это делает цель очереди приоритетов ясной и лаконичной. Его единственная задача - **поставить в очередь и удалять элементы из очереди**, ничего больше!
<br> </br>

## **O(n2) Sorting**

| Sorting | implementation | 
| ------------- | ------------- | 
| Bubble Sort | [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%204.%20Sorting%20Algorithms/n-2-sorting/n-2-sorting.playground/Sources/BubbleSort.swift) | 
| Insertion Sort | [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%204.%20Sorting%20Algorithms/n-2-sorting/n-2-sorting.playground/Sources/InsertionSort.swift) |
| Selection Sort | [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%204.%20Sorting%20Algorithms/n-2-sorting/n-2-sorting.playground/Sources/SelectionSort.swift) | 

### Key points
- Алгоритмы **n2** часто имеют плохую репутацию, но некоторые из этих алгоритмов обычно имеют определенные преимущества. **InsertSort** может выполнять сортировку за **O(n)** раз, если коллекция уже отсортирована, и постепенно уменьшается до **O(n2)**.
- **InsertSort** - один из лучших способов сортировки в ситуациях, когда вы заранее знаете, что ваши данные в основном находятся в отсортированном порядке.
<br> </br>
## **Merge Sort**
### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/tree/main/Section%204.%20Sorting%20Algorithms/merge-sort/merge-sort.playground)
- Сортировка слиянием относится к категории алгоритмов **«разделяй и властвуй»**.
- Существует множество реализаций сортировки слиянием, и вы можете иметь разные характеристики производительности в зависимости от реализации.

<br> </br>

## **Radix Sort**
### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%204.%20Sorting%20Algorithms/radix-sort/RadixSort.playground/Sources/RadixSort.swift)
- Радиксная сортировка - это несравнительная сортировка, которая не основывается на сравнении двух значений. Сортировка Radix использует сегментную сортировку, которая похожа на решето для фильтрации значений. Полезная аналогия - это то, как некоторые торговые автоматы принимают монеты - монеты различаются по размеру.
- Radix sort может быть одним из самых быстрых алгоритмов сортировки для сортировки значений с позиционным обозначением.
- В этой главе описана сортировка по основанию счисления младших разрядов. Другой способ реализовать сортировку по системе счисления - это форма старших цифр. Эта форма сортирует, отдавая приоритет наиболее значимым цифрам над меньшими, и лучше всего иллюстрируется поведением сортировки типа String.
<br> </br>

## **Heap Sort**
### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%204.%20Sorting%20Algorithms/heap-sort/HeapSort.playground/Contents.swift)
- Сортировка кучи использует структуру данных **max-heap**(максимальной кучи) для сортировки элементов в массиве.
<br> </br>

## **Quick Sort**

| Sorting | implementation | 
| ------------- | ------------- | 
| Lomuto’s | [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%204.%20Sorting%20Algorithms/quick-sort/quicksort.playground/Sources/quicksortLomuto.swift) | 
| Hoare’s  | [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%204.%20Sorting%20Algorithms/quick-sort/quicksort.playground/Sources/quicksortHoare.swift) |
| Median | [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%204.%20Sorting%20Algorithms/quick-sort/quicksort.playground/Sources/quicksortMedian.swift) | 
| Naive | [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%204.%20Sorting%20Algorithms/quick-sort/quicksort.playground/Sources/quicksortNaive.swift) | 
| Dutch Flag | [example](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/blob/main/Section%204.%20Sorting%20Algorithms/quick-sort/quicksort.playground/Sources/quicksortDutchFlag.swift) | 

### Key points
- Наивное разбиение создает новый массив для каждой функции фильтра; это неэффективно. Все остальные стратегии действуют.
- При разбиении **Lomuto’s** последний элемент выбирается в качестве опорного.
- При разбиении **Hoare’s** в качестве стержня выбирается первый элемент.
- Идеальная опора могла бы равномерно разделить элементы между перегородками.
- Выбор плохого поворота может привести к выполнению быстрой сортировки за **O(n2)**.
- **Median of three** находит точку поворота, беря медианы первого, среднего и последнего элементов.
- Стратегия разделения голландского национального флага помогает более эффективно организовать повторяющиеся элементы.

<br> </br>

## **Graphs**

| Operations | Adjacency List | Adjacency Matrix |
| ------------- | ------------- | ------------- | 
| Storage Space | **O(V+E)** | **O(V^2)** |  
| Add Vertex | **O(1)** | **O(V^2)** |
| Add Edge | **O(1)** | **O(1)** |
| Finding Edges and Weight | **O(V)** | **O(1)** |

### Key points
- [implementation](https://github.com/egorskikh/IOS-Data-Structures-and-Algorithms/tree/main/Section%205.%20Graphs/graphs/Graph.playground/Sources)
- Вы можете представить отношения в реальном мире через вершины и ребра.
- Думайте о вершинах как об объектах, а о ребрах как о взаимосвязях между объектами.
- Взвешенные графы связывают вес с каждым ребром.
- Направленные графы имеют ребра, которые пересекаются в одном направлении.
- Ненаправленные графы имеют ребра, указывающие в обе стороны.
- В списке смежности хранится список исходящих ребер для каждой вершины.
- Матрица смежности использует квадратную матрицу для представления графика.
- Список смежности обычно хорош для разреженных графов, когда ваш граф имеет наименьшее количество ребер.
- Матрица смежности обычно хороша для плотных графов, когда у вашего графа много ребер.
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
