import Algorithms
import Foundation

public final class Day9: Day {
    let input: [(String, Int)]

    public init(input: String) {
        self.input = input
            .trimmedLines
            .map { $0.split(separator: " ") }
            .map { (String($0[0]), Int(String($0[1]))!) }
    }

    public func part1() -> Int {
        var visits = Set<String>(arrayLiteral: "0,0")
        var head = (0,0)
        var tail = (0,0)

        input
            .forEach { direction, distance in
                (0 ..< distance).forEach { _ in
                    switch direction {
                    case "U":
                        head = (head.0, head.1 + 1)

                        if abs(head.1 - tail.1) >= 2 {
                            tail = (head.0, tail.1 + 1)
                        }
                    case "D":
                        head = (head.0, head.1 - 1)

                        if abs(head.1 - tail.1) >= 2 {
                            tail = (tail.0, tail.1 - 1)
                        }
                    case "L":
                        head = (head.0 - 1, head.1)

                        if abs(head.0 - tail.0) >= 2 {
                            tail = (tail.0 - 1, head.1)
                        }
                    case "R":
                        head = (head.0 + 1, head.1)

                        if abs(head.0 - tail.0) >= 2 {
                            tail = (tail.0 + 1, head.1)
                        }
                    default: fatalError()
                    }

                    visits.insert("\(tail.0),\(tail.1)")
                }
            }

        return visits.count
    }

    public func part2() -> Int {
        return 0
    }
}
