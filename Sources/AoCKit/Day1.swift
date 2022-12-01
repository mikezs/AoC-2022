import Algorithms
import Foundation

public final class Day1: Day {
    let input: [Int]

    public init(input: String) {
        var elves = [0]

        input.trimmedLines.forEach {
            if $0.isEmpty {
                elves.append(0)
            } else {
                elves[elves.count - 1] += Int($0) ?? 0
            }
        }

        self.input = elves
    }

    public func part1() -> Int {
        input.max() ?? 0
    }

    public func part2() -> Int {
        input.sorted().suffix(3).reduce(0) {$0 + $1}
    }
}
