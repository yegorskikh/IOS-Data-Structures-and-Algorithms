import Foundation

func merge<T: Sequence>(first: T, second: T) -> AnySequence<T.Element> where T.Element: Comparable {
    
    // Создайте новый контейнер для хранения объединенных последовательностей.
    var result: [T.Element] = []
    
    /*
     Возьмите итераторы первой и второй последовательности.
     Итераторы последовательно распределяют значения последовательности с помощью следующего метода.
    */
    var firstIterator = first.makeIterator()
    var secondIterator = second.makeIterator()
    
    /*
     Создайте две переменные, инициализируемые как первое значение первого и второго итератора.
     next возвращает необязательный элемент последовательности, а возвращаемое значение nil предполагает,
     что итератор распределил все элементы в последовательности.
     */
    var firstNextValue = firstIterator.next()
    var secondNextValue = secondIterator.next()
    
    while let first = firstNextValue,
          let second = secondNextValue {
        if first < second {
            /*
             Если первое значение меньше второго,
             вы добавляете первое значение в результат и добавляете следующее значение для сравнения,
             вызывая next для первого итератора.
             */
            result.append(first)
            firstNextValue = firstIterator.next()
        } else if second < first {
            /*
             Если второе значение меньше первого, вы сделаете наоборот.
             Вы вводите следующее значение для сравнения, вызывая next на втором итераторе.
             */
            result.append(second)
            secondNextValue = secondIterator.next()
        } else {
            /*
             Если второе значение меньше первого, вы сделаете наоборот.
             Вы вводите следующее значение для сравнения, вызывая next на втором итераторе.
             */
            result.append(first)
            result.append(second)
            firstNextValue = firstIterator.next()
            secondNextValue = secondIterator.next()
        }
    }
    
    while let first = firstNextValue {
        result.append(first)
        firstNextValue = firstIterator.next()
    }
    
    while let second = secondNextValue {
        result.append(second)
        secondNextValue = secondIterator.next()
    }
    
    return AnySequence<T.Element>(result)
}
