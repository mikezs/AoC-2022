import XCTest
@testable import AoCKit

final class ArrayExtensionTests: XCTestCase {
    func testAddOptionalElement() {
        var empty: [Int] = []
        empty.append(nil)
        XCTAssertEqual(empty, [Int]())

        empty = []
        empty.append(.some(1))
        XCTAssertEqual(empty, [1])
    }

    func testMode() {
        let ones = ["1", "1", "1", "0"]
        XCTAssertEqual(ones.mode, ["1"])

        let equal = ["1", "1", "0", "0"]
        XCTAssertEqual(equal.mode.sorted(), ["0", "1"])

        XCTAssertEqual(Array<Int>().mode, [])
    }

    func testCounts() {
        XCTAssertEqual(["a", "a", "b"].counts, ["a": 2, "b": 1])
        XCTAssertEqual(["a"].counts, ["a": 1])
        XCTAssertEqual([Int]().counts, [Int: Int]())
    }

    func testVerticalSlice() {
        let array = [
            ["a", "b", "c"],
            ["d", "e", "f"],
            ["g", "h", "i"]
        ]

        XCTAssertEqual(array.verticalSlice(1), ["b", "e", "h"])
    }
}
