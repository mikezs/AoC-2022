import Algorithms
import Foundation

public final class Day5: Day {
    typealias Crate = Character

    struct Move {
        let number: Int
        let from: Int
        let to: Int

        init?(_ string: String) {
            let parts = string.split(separator: " ").compactMap { Int($0) }

            guard parts.count == 3 else { return nil }
            number = parts[0]
            from = parts[1] - 1
            to = parts[2] - 1
        }
    }

    let stacks: [[Crate]]
    let moves: [Move]

    public init(input: String) {
        let parts = input.components(separatedBy: "\n\n")

        var stacksLines = Array(parts[0].components(separatedBy: .newlines).reversed())
        moves = parts[1].components(separatedBy: .newlines).compactMap { Move($0) }

        let numStacks = stacksLines
            .remove(at: 0)
            .compactMap { Int(String($0)) }
            .last!

        var stacksArray = [[Crate]](repeating: [Crate](), count: numStacks)

        stacksLines.forEach {
            $0.chunks(ofCount: 4)
                .enumerated()
                .map { ($0, $1[1] as Crate) }
                .filter { !$1.isWhitespace }
                .forEach { stacksArray[$0].append($1) }
        }

        stacks = stacksArray
    }

    func move(using: (inout [[Crate]], Move) -> Void) -> String {
        var mutableStacksCopy = stacks

        moves.forEach { using(&mutableStacksCopy, $0) }

        return mutableStacksCopy
            .compactMap { $0.last }
            .reduce(String()) { $0 + String($1) }
    }

    public func part1() -> String {
        move { stacks, move in
            (0 ..< move.number).forEach { _ in
                stacks[move.to].append(stacks[move.from].popLast())
            }
        }
    }

    public func part2() -> String {
        move { stacks, move in
            stacks[move.to]
                .append(contentsOf: (0 ..< move.number)
                    .compactMap { _ in stacks[move.from].popLast() }
                    .reversed())
        }
    }
}
