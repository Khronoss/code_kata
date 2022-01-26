/*
 Kata: Binary Search (http://codekata.com/kata/kata02-karate-chop/)

 Implementation: recursive
 */


/// Kata's requirement
/// - Parameters:
///   - target: The integer to find
///   - array: The list of integer to look into
/// - Returns: The target's index in the given array. -1 in case of value not found
func chop(
    _ target: Int,
    _ array: [Int],
    offset: Int = 0
) -> Int {
    if array.isEmpty {
        return -1
    }    

    if array.count == 1, let head = array.first {
        return head == target ? offset : -1
    }

    let midPoint = array.count / 2

    switch array[midPoint] {
        case let value where value == target: 
            return offset + midPoint
        
        case let value where value > target:
            return chop(target, Array(array[0..<midPoint]), offset: offset)

        case let value where value < target:
            return chop(target, Array(array[midPoint..<array.count]), offset: offset + midPoint)

        default: return -1
    }
}