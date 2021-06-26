// Copyright (c) 2019 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

import Foundation

public func quicksortNaive<T: Comparable>(_ a: [T]) -> [T] {
    
    /*
     В массиве должно быть более одного элемента.
     В противном случае массив считается отсортированным.
     */
    guard a.count > 1 else { return a }
    
    /*
     Выберите средний элемент массива в качестве точки поворота.
     */
    let pivot = a[a.count / 2]
    
    /*
     Используя стержень, разделите исходный массив на три раздела.
     Элементы меньше, равный или больший, чем точка поворота, попадают в разные сегменты.
     */
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    /*
     Рекурсивно отсортируйте разделы, а затем объедините их.
     */
    return quicksortNaive(less) + equal + quicksortNaive(greater)
}
