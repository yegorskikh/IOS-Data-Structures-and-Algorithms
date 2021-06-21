import Foundation

extension Array where Element == Int {
    
    public mutating func radixSort() {
        
        /*
         В данном случае вы сортируете целые числа по основанию 10.
         Поскольку вы будете использовать это значение несколько раз в алгоритме
         вы сохраняете его в постоянной базе.
         */
        let base = 10
        
        /*
         Вы объявляете две переменные для отслеживания своего прогресса.
         Сортировка Radix работает в несколько проходов, поэтому done служит флагом,
         определяющим, завершена ли сортировка.
         Переменная digits отслеживает текущую цифру, которую вы смотрите.
         */
        var done = false
        var digits = 1
        
        while !done {
            
            done = true
            
            /*
             Вы создаете экземпляры сегментов, используя двумерный массив.
             Поскольку вы используете основание 10, вам нужно 10 ведер.
             */
            var buckets: [[Int]] = .init(repeating: [], count: base)
            
            /*
             Вы помещаете каждое число в правильное ведро.
             */
            forEach { number in
                let remainingPart = number / digits
                let digit = remainingPart % base
                buckets[digit].append(number)
                
                if remainingPart > 0 {
                    done = false
                }
                
            }
            
            /*
             Вы обновляете цифры до следующей цифры, которую хотите проверить,
             и обновляете массив, используя содержимое сегментов.
             flatMap сведет двухмерный массив к одномерному, как если бы вы опустошали ведра в массив.
             */
            digits *= base
            self = buckets.flatMap { $0 }
        }
        
    }
    
}
