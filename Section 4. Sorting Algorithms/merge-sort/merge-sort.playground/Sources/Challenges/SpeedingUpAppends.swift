import Foundation

public func speedingUpAppends(_ input: Int) -> [Int] {
    
    var values: [Int] = []
    
    /*
     Если вы добавляете в коллекцию известное количество элементов, используйте этот метод,
     чтобы избежать многократного перераспределения. Тип, соответствующий RangeReplaceableCollection,
     может выбирать, как реагировать на вызов этого метода.
     В зависимости от типа может иметь смысл выделить больше или меньше памяти, чем запрошено,
     или вообще не предпринимать никаких действий.
     */
    values.reserveCapacity(input)

    for i in 0 ..< input {
        values.append(i)
    }
    
    return values
}

