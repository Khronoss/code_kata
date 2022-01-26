
print("Start testing chop")
testChop()
print("End")

/*
 Verification Tests
 */

func testChop() {
    assertEqual(-1, chop(3, []))
    assertEqual(-1, chop(3, [1]))
    assertEqual(0,  chop(1, [1]))

    assertEqual(0,  chop(1, [1, 3, 5]))
    assertEqual(1,  chop(3, [1, 3, 5]))
    assertEqual(2,  chop(5, [1, 3, 5]))
    assertEqual(-1, chop(0, [1, 3, 5]))
    assertEqual(-1, chop(2, [1, 3, 5]))
    assertEqual(-1, chop(4, [1, 3, 5]))
    assertEqual(-1, chop(6, [1, 3, 5]))

    assertEqual(0,  chop(1, [1, 3, 5, 7]))
    assertEqual(1,  chop(3, [1, 3, 5, 7]))
    assertEqual(2,  chop(5, [1, 3, 5, 7]))
    assertEqual(3,  chop(7, [1, 3, 5, 7]))
    assertEqual(-1, chop(0, [1, 3, 5, 7]))
    assertEqual(-1, chop(2, [1, 3, 5, 7]))
    assertEqual(-1, chop(4, [1, 3, 5, 7]))
    assertEqual(-1, chop(6, [1, 3, 5, 7]))
    assertEqual(-1, chop(8, [1, 3, 5, 7]))
}

/*
 General helpers
 */
func assertEqual(
    _ expected: @autoclosure () -> Int,
    _ test: @autoclosure () -> Int,
    file: StaticString = #filePath,
    line: UInt = #line
) {
    let expectation = expected()
    let result = test()

    if expectation == result {
        printColored("(\(file):\(line)): Success!", in: .green)
    } else {
        printColored("(\(file):\(line)): Failed -- \(expectation) != \(result)", in: .red)
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
