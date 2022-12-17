import Algorithms
import Foundation

public final class Day12: Day {
    let input: [[Int]]

    public init(input: String) {
        self.input = input.trimmedLines.map { $0.compactMap { String($0).ord } }
    }

    public func part1() -> Int {
        31
    }

    public func part2() -> Int {
        0
    }
}
