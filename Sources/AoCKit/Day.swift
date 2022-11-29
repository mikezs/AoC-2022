import Foundation

enum Error: Swift.Error {
    case invalidInput
}

public protocol Day {
    init(input: String) throws
    func part1() throws -> Int
    func part2() throws -> Int
}

/*
import Algorithms
import Foundation

public final class DayX: Day {
    let input: [Int]

    public init(input: String) {
        self.input = input.trimmedLines.compactMap { Int($0) }
    }

    public func part1() -> Int {
        return 0
    }

    public func part2() -> Int {
        return 0
    }
}
*/
