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

    func move(head: inout (Int, Int), and tail: inout (Int, Int), in direction: String?) {
//        let originalTail = tail

        switch direction {
        case "U":
            head = (head.0, head.1 + 1)

            if abs(head.1 - tail.1) >= 2 {
                // If we've moved a whole row away, we change the column offset by the distance the head from the tail is
                tail = (tail.0 + (head.0 - tail.0), tail.1 + 1)
            }
        case "D":
            head = (head.0, head.1 - 1)

            if abs(head.1 - tail.1) >= 2 {
                tail = (tail.0 + (head.0 - tail.0), tail.1 - 1)
            }
        case "L":
            head = (head.0 - 1, head.1)

            if abs(head.0 - tail.0) >= 2 {
                // If we've moved a whole column away, we change the row offset by the distance the head from the tail is (either stay the same or move diagonally)
                tail = (tail.0 - 1, tail.1 + (head.1 - tail.1))
            }
        case "R":
            head = (head.0 + 1, head.1)

            if abs(head.0 - tail.0) >= 2 {
                tail = (tail.0 + 1, tail.1 + (head.1 - tail.1))
            }
        default: break
        }

//        if abs(head.1 - originalTail.1) >= 2 {
//                // If we've moved a whole row away, we change the column offset by the distance the head from the tail is
//            tail = (tail.0 + (head.0 - originalTail.0), tail.1)
//        }
//
//        if abs(head.0 - originalTail.0) >= 2 {
//                // If we've moved a whole column away, we change the row offset by the distance the head from the tail is (either stay the same or move diagonally)
//            tail = (tail.0 - 1, tail.1 + (head.1 - originalTail.1))
//        }
    }

    func visitsFor(knots: Int) -> Set<String> {
        var visits = Set<String>(arrayLiteral: "0,0")
        var ropes = [(Int, Int)](repeating: (0,0), count: knots)

        input
            .forEach { direction, distance in
                print("\(direction) \(distance)")

                (0 ..< distance).forEach { _ in
                    var newRopes = [(Int, Int)](repeating: (0,0), count: knots)

                    (0 ..< ropes.count - 1).forEach {
                        var first = ropes[$0]
                        var second = ropes[$0+1]
                        move(head: &first, and: &second, in: $0 == 0 ? direction : nil)
                        newRopes[$0] = first
                        newRopes[$0+1] = second
                    }

                    ropes = newRopes

                    ropes.enumerated().forEach { print("\($0.offset) \($0.element)") }
                    print("")

                    visits.insert("\(ropes.last!.0),\(ropes.last!.1)")
                }
            }

        return visits
    }

    public func part1() -> Int {
        visitsFor(knots: 2).count
    }

    public func part2() -> Int {
        visitsFor(knots: 10).count
    }
}
