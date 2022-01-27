/*
 Kata: Binary Search (http://codekata.com/kata/kata02-karate-chop/)
 
 Specialized implementation using Swift's Generic types like Sequence
 In the hope that the chop function would be usable for any sortable array

 Implementation: functional, recursive
 */

import Foundation

/// Kata's requirement applied to Swift's Collection type
/// - Parameters:
///   - target: The element to find
///   - array: The collection to look into
/// - Returns: The target's index in the given collection. nil in case of value not found
func chop<T>(
    _ target: T.Element,
    _ array: T
) -> T.Index? where T: Collection, T.Element: Comparable {
    if array.isEmpty {
        return nil
    }

    let midPoint = array.index(array.startIndex, offsetBy: array.count / 2)

    switch array[midPoint] {
        case let value where value == target: 
            return midPoint

        case let value where value > target: 
            return chop(target, array[array.startIndex..<midPoint])

        case let value where value < target: 
            return chop(target, array[array.index(after: midPoint)..<array.endIndex])

        default:
            return nil
    }
}





//
// Unit Tests. The chop declaration changes too much to be used with tests in unit_tests.swift
//
print("Start testing chop")
testChop()
print("End")

/*
 Verification Tests
 */

func testChop() {
    assertEqual(nil, chop(3, []))
    assertEqual(nil, chop(3, [1]))
    assertEqual(0,  chop(1, [1]))

    assertEqual(0,  chop(1, [1, 3, 5]))
    assertEqual(1,  chop(3, [1, 3, 5]))
    assertEqual(2,  chop(5, [1, 3, 5]))
    assertEqual(nil, chop(0, [1, 3, 5]))
    assertEqual(nil, chop(2, [1, 3, 5]))
    assertEqual(nil, chop(4, [1, 3, 5]))
    assertEqual(nil, chop(6, [1, 3, 5]))

    assertEqual(0,  chop(1, [1, 3, 5, 7]))
    assertEqual(1,  chop(3, [1, 3, 5, 7]))
    assertEqual(2,  chop(5, [1, 3, 5, 7]))
    assertEqual(3,  chop(7, [1, 3, 5, 7]))
    assertEqual(nil, chop(0, [1, 3, 5, 7]))
    assertEqual(nil, chop(2, [1, 3, 5, 7]))
    assertEqual(nil, chop(4, [1, 3, 5, 7]))
    assertEqual(nil, chop(6, [1, 3, 5, 7]))
    assertEqual(nil, chop(8, [1, 3, 5, 7]))

    assertEqual(56, chop(56, Array((0...100_000))))

    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    assertEqual(alphabet.startIndex, chop("a", alphabet))
    assertEqual(alphabet.index(before: alphabet.endIndex), chop("z", alphabet))
    assertEqual(alphabet.index(alphabet.startIndex, offsetBy: 10), chop("k", alphabet))
    assertEqual(nil, chop("!", alphabet))

    let range = (0...100)
    assertEqual(range.startIndex, chop(0, range))
    assertEqual(range.index(before: range.endIndex), chop(100, range))
    assertEqual(range.index(range.startIndex, offsetBy: 56), chop(56, range))
    assertEqual(nil, chop(123, range))
}

/*
 General helpers
 */
func assertEqual<T>(
    _ expected: @autoclosure () -> T,
    _ test: @autoclosure () -> T,
    file: StaticString = #filePath,
    line: UInt = #line
) where T: Equatable {
    let expectation = expected()
    let result = test()

    if expectation == result {
        printColored("(\(file):\(line)): Success!", in: .green)
    } else {
        printColored("(\(file):\(line)): Failed -- expectation(\(expectation)) != result(\(result))", in: .red)
    }
}

func printColored(
    _ message: String,
    in color: ANSIColor
) {
    print(color.rawValue + message + ANSIColor.default.rawValue)
}

enum ANSIColor: String {
    case black = "\u{001B}[0;30m"
    case red = "\u{001B}[0;31m"
    case green = "\u{001B}[0;32m"
    case yellow = "\u{001B}[0;33m"
    case blue = "\u{001B}[0;34m"
    case magenta = "\u{001B}[0;35m"
    case cyan = "\u{001B}[0;36m"
    case white = "\u{001B}[0;37m"
    case `default` = "\u{001B}[0;0m"
}
