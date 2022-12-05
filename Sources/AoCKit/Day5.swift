import Algorithms
import Foundation

public final class Day5: Day {
    typealias Crate = Character

    struct Move {
        let number: Int
        let from: Int
        let to: Int

        init(_ string: String) {
            let parts = string.split(separator: " ")
            number = Int(parts[1])!
            from = Int(parts[3])! - 1
            to = Int(parts[5])! - 1
        }
    }

    let stacks: [[Crate]]
    let moves: [Move]

    public init(input: String) {
        let lines = input
            .components(separatedBy: .newlines)

        var parsingStacks = true
        var stacksLines = [String]()
        var movesLines = [Move]()

        lines.forEach { line in
            if line.isEmpty {
                parsingStacks = false
                return
            }

            if parsingStacks {
                stacksLines.insert(line, at: 0)
            } else {
                movesLines.append(Move(line))
            }
        }

        moves = movesLines

        let numStacks = stacksLines
            .remove(at: 0)
            .compactMap { Int(String($0)) }
            .last!

        var tempStacks = [[Crate]](repeating: [Crate](), count: numStacks)

        stacksLines.forEach {
            let crates = $0.chunks(ofCount: 4)

            crates
                .enumerated()
                .forEach {
                    let crate = $1[1]

                    if !crate.isWhitespace {
                        tempStacks[$0].append(crate)
                    }
                }
        }

        stacks = tempStacks
    }

    public func part1() -> String {
        var movedStacks = stacks

        moves
            .forEach { move in
                (0 ..< move.number).forEach { _ in
                    if let crate = movedStacks[move.from].popLast() {
                        movedStacks[move.to].append(crate)
                    }
                }
            }

        return movedStacks
            .reduce("") {
                if let char = $1.last {
                    return $0 + String(char)
                }

                return $0
            }
    }

    public func part2() -> String {
        var movedStacks = stacks

        moves
            .forEach { move in
                var cratesToMove = [Crate]()

                (0 ..< move.number).forEach { _ in
                    if let crate = movedStacks[move.from].popLast() {
                        cratesToMove.insert(crate, at: 0)
                    }
                }

                movedStacks[move.to].append(contentsOf: cratesToMove)
            }

        return movedStacks
            .reduce("") {
                if let char = $1.last {
                    return $0 + String(char)
                }

                return $0
            }
    }
}
