import Foundation

public func mergeSort<Element>(_ array: [Element]) -> [Element] where Element: Comparable {
    
    /*
     Для рекурсии нужен базовый вариант, который также можно рассматривать как «условие выхода».
     В этом случае базовый случай - это когда массив состоит только из одного элемента.
     */
    guard array.count > 1 else { return array }
    
    let middle = array.count / 2
    /*
     Теперь вы вызываете mergeSort для левой и правой половин исходного массива.
     Как только вы разделите массив пополам, вы снова попытаетесь разделить его.
     */
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    
    return merge(left, right)
}



private func merge<Element>(_ left: [Element],
                            _ right: [Element]) -> [Element] where Element: Comparable {
    
    /*
     Переменные leftIndex и rightIndex отслеживают ваш прогресс при анализе двух массивов.
     */
    var leftIndex = 0
    var rightIndex = 0
    
    // Массив результатов будет содержать объединенный массив.
    var result: [Element] = []
   
    /*
     Начиная с начала, вы последовательно сравниваете элементы в левом и правом массивах.
     Если вы достигли конца любого массива, сравнивать больше нечего.
     */
    while leftIndex < left.count && rightIndex < right.count {
        
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        /*
         В массив результатов попадает меньший из двух элементов.
         Если бы элементы были равными, их можно было бы добавить оба.
         */
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    
    /*
     Первый цикл гарантирует, что left или right пусто. Поскольку оба массива отсортированы, это гарантирует,
     что оставшиеся элементы больше или равны тем, которые в настоящее время находятся в результате.
     В этом сценарии вы можете добавить остальные элементы без сравнения.
     */
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    
    return result
}
