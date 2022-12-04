import Algorithms
import Foundation

public final class Day4: Day {
    let input: [(ClosedRange<Int>, ClosedRange<Int>)]

    public init(input: String) {
        self.input = input
            .trimmedLines
            .map {
                $0
                    .split(separator: ",")
                    .map { $0.split(separator: "-").map { Int($0)! } }
                    .map { $0[0]...$0[1] }
            }
            .map { ($0[0], $0[1]) }
    }

    public func part1() -> Int {
        input
            .filter {
                $0.0.clamped(to: $0.1) == $0.0 ||
                $0.1.clamped(to: $0.0) == $0.1
            }
            .count
    }

    public func part2() -> Int {
        input
            .filter { $0.0.overlaps($0.1) }
            .count
    }
}
