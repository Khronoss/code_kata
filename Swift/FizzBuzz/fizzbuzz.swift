
///
///  1, 2, 3, 4, 5, 6.....
///   multiple de 3 -> Fizz
///    multiple de 5 -> Buzz
///      multiple de 3 ET de 5 -> FizzBuzz


///
///  [1, 2, 3, 4, 5] -> [ "1", "2", "Fizz", "4", "Buzz"]
///
///
func fizzBuzz(_ array: [Int]) -> [String] {
    array
        .map(fizzBuzz)
}

func fizzBuzz(single: Int) -> String {
    let isMultipleOfThree = single % 3 == 0
    let isMultipleOfFive = single % 5 == 0

    switch (isMultipleOfThree, isMultipleOfFive) {
        case (true, true):
            return "FizzBuzz"

        case (true, false):
            return "Fizz"

        case (false, true):
            return "Buzz"

        default:
            return "\(single)"
    }
}


// Tests

func testGiveOneItShouldReturnOne() {
    let expect = "1"
    let res = fizzBuzz(single: 1)

    assertEqual(expect, res)
}

func testGiveTwoItShouldReturnTwo() {
    let expect = "2"
    let res = fizzBuzz(single: 2)

    assertEqual(expect, res)
}

func testGiveThreeItShouldReturnThree() {
    let expect = "Fizz"
    let res = fizzBuzz(single: 3)

    assertEqual(expect, res)
}

func testGiveFiveItShouldReturnFive() {
    let expect = "Buzz"
    let res = fizzBuzz(single: 5)

    assertEqual(expect, res)
}

func testGiveSixItShouldReturnSix() {
    let expect = "Fizz"
    let res = fizzBuzz(single: 6)

    assertEqual(expect, res)
}

func testGiveFifteenItShouldReturnFifteen() {
    let expect = "FizzBuzz"
    let res = fizzBuzz(single: 15)

    assertEqual(expect, res)
}

func testFizzBuzzFromOneToTwenty() {
    let expect = [
        "1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz", "16", "17", "Fizz", "19", "Buzz"
    ]
    let res = fizzBuzz(Array((1...20)))

    assertEqual(expect, res)
}

// Launch tests
testGiveOneItShouldReturnOne()
testGiveTwoItShouldReturnTwo()
testGiveThreeItShouldReturnThree()
testGiveFiveItShouldReturnFive()
testGiveSixItShouldReturnSix()
testGiveFifteenItShouldReturnFifteen()
testFizzBuzzFromOneToTwenty()



/*
 General helpers
 */
func assertEqual<T: Equatable>(
    _ expected: @autoclosure () -> T,
    _ test: @autoclosure () -> T,
    file: StaticString = #filePath,
    line: UInt = #line
) {
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
