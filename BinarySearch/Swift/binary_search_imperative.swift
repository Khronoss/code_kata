/*
 Kata 001: Binary Search (http://codekata.com/kata/kata02-karate-chop/)

 Implemented imperatively, not in OOP, with most basic tools
 */


/// Kata's requirement
/// - Parameters:
///   - target: The integer to find
///   - array: The list of integer to look into
/// - Returns: The target's index in the given array. -1 in case of value not found
func chop(
    _ target: Int,
    _ array: [Int]
) -> Int {
    var lowerBound = 0
    var upperBound = array.count - 1
    var index = -1

    while index == -1 {
        if upperBound < lowerBound {
            break
        }

        let midPoint = lowerBound + (upperBound - lowerBound) / 2

        if array[midPoint] < target {
            lowerBound = midPoint + 1
        } else if array[midPoint] > target {
            upperBound = midPoint - 1
        } else {
            index = midPoint
        }
    }

    return index
}
