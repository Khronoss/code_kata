/*
 Kata 001: Binary Search (http://codekata.com/kata/kata02-karate-chop/)

 Implementation type: imperative, recursive
 */


/// Kata's requirement
/// - Parameters:
///   - target: The integer to find
///   - array: The list of integer to look into
/// - Returns: The target's index in the given array. -1 in case of value not found
func chop(
    _ target: Int,
    _ array: [Int],
    lowerBound: Int = 0,
    upperBound: Int? = nil
) -> Int {
    let upperBound = upperBound ?? array.count
    let midPoint = lowerBound + (upperBound - lowerBound) / 2

    guard lowerBound < upperBound else {
        return -1
    }

    let midValue = array[midPoint]
    if midValue == target {
        return midPoint
    } else if midValue > target {
        return chop(target, array, lowerBound: lowerBound, upperBound: midPoint)
    } else {
        return chop(target, array, lowerBound: midPoint + 1, upperBound: array.count)
    }
}
