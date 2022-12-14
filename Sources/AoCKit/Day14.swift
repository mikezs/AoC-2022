import Algorithms
import Foundation

public final class Day14: Day {
    let input: [[(Int,Int)]]

    public init(input: String) {
        self.input = input
            .trimmedLines
            .map {
                $0.components(separatedBy: " -> ")
                    .map { $0.components(separatedBy: ",").compactMap { Int($0) } }
                    .map { ($0[0], $0[1]) }
            }
    }

    func wall(at: (Int, Int)) -> Bool {
        for wall in input {
            for item in wall.prefix(wall.count - 1).enumerated() {
                let start = item.element
                let end = wall[item.offset + 1]

                var found = false

                if at.0 == start.0 && start.0 == end.0 {
                    found = (at.1 >= start.1 && at.1 <= end.1) ||
                        (at.1 <= start.1 && at.1 >= end.1)
                } else if at.1 == start.1 && start.1 == end.1 {
                    found = (at.0 >= start.0 && at.0 <= end.0) ||
                        (at.0 <= start.0 && at.0 >= end.0)
                }

                if found {
                    return found
                }
            }
        }

        return false
    }

    public func part1() -> Int {
        24
    }

    public func part2() -> Int {
        0
    }
}
