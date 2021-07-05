import Foundation

public extension RandomAccessCollection where Element: Comparable {
    
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        
        let range = range ?? startIndex..<endIndex
        
        guard range.lowerBound < range.upperBound else { return nil }
        
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size / 2)
        
        if self[middle] == value {
            return middle
        } else if self[middle] > value {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else {
            return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
        }
    }
    
}

/*
 Поскольку двоичный поиск работает только для типов, соответствующих RandomAccessCollection,
 вы добавляете метод в расширение RandomAccessCollection.
 Это расширение ограничено, так как вам нужно иметь возможность сравнивать элементы.
 
 Двоичный поиск является рекурсивным, поэтому вы должны иметь возможность перейти в диапазон для поиска.
 Диапазон параметров сделан необязательным, поэтому вы можете начать поиск, не указывая диапазон.
 В этом случае, когда диапазон равен нулю, будет выполняться поиск по всей коллекции.
 
 Сначала вы проверяете, равен ли диапазон нулю. Если это так, вы создаете диапазон, охватывающий всю коллекцию.
 
 Затем вы проверяете, содержит ли диапазон хотя бы один элемент.
 Если этого не произошло, поиск не удался и вы вернете ноль.
 
 Теперь, когда вы уверены, что у вас есть элементы в диапазоне, вы найдете средний индекс в диапазоне.
 
 Затем вы сравниваете значение этого индекса со значением, которое ищете.
 Если они совпадают, вы возвращаете средний индекс.
 
 Если нет, вы рекурсивно ищите в левой или правой половине коллекции.
 */
