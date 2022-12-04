import Algorithms
import Foundation

func ==(lhs: Day2.RoundResult.Error, rhs: Day2.RoundResult.Error) -> Bool {
    switch (lhs, rhs) {
    case let (.invalidResult(a), .invalidResult(b)): return a == b
    }
}

func ==(lhs: Day2.Move.Error, rhs: Day2.Move.Error) -> Bool {
    switch (lhs, rhs) {
    case let (.invalidOpponentMove(a), .invalidOpponentMove(b)): return a == b
    case let (.invalidPlayerMove(a), .invalidPlayerMove(b)): return a == b
    default: return false
    }
}

public final class Day2: Day {
    enum RoundResult: Int {
        enum Error: Swift.Error, Equatable {
            case invalidResult(String)
        }

        case lose = 0
        case draw = 3
        case win = 6

        static func result(_ result: String) throws -> RoundResult {
            switch result.lowercased() {
            case "x": return .lose
            case "y": return .draw
            case "z": return .win
            default: throw Error.invalidResult(result)
            }
        }

        func moveAgainst(opponent: Move) -> Move {
            switch (self, opponent) {
            case (.lose, .rock): return .scissors
            case (.win, .rock): return .paper
            case (.lose, .paper): return .rock
            case (.win, .paper): return .scissors
            case (.lose, .scissors): return .paper
            case (.win, .scissors): return .rock
            default: return opponent
            }
        }
    }

    enum Move: Int {
        enum Error: Swift.Error, Equatable {
            case invalidOpponentMove(String)
            case invalidPlayerMove(String)
        }

        case rock = 1
        case paper = 2
        case scissors = 3

        static func from(opponent: String) throws -> Move {
            switch opponent.lowercased() {
            case "a": return .rock
            case "b": return .paper
            case "c": return .scissors
            default: throw Error.invalidOpponentMove(opponent)
            }
        }

        static func from(player: String) throws -> Move {
            switch player.lowercased() {
            case "x": return .rock
            case "y": return .paper
            case "z": return .scissors
            default: throw Error.invalidPlayerMove(player)
            }
        }

        func scoreAgainst(opponent: Move) -> Int {
            switch (self, opponent) {
            case (.rock, .paper): return 0
            case (.rock, .scissors): return 6
            case (.paper, .scissors): return 0
            case (.paper, .rock): return 6
            case (.scissors, .rock): return 0
            case (.scissors, .paper): return 6
            default: return 3
            }
        }
    }

    let input: [(Move, Move)]
    let input2: [(Move, RoundResult)]

    public init(input: String) throws {
        self.input = try input.trimmedLines.compactMap {
            let players = $0.split(separator: " ")
            return (try Move.from(opponent: String(players[0])),
                    try Move.from(player: String(players[1])))
        }

        self.input2 = try input.trimmedLines.compactMap {
            let players = $0.split(separator: " ")
            return (try Move.from(opponent: String(players[0])),
                    try RoundResult.result(String(players[1])))
        }
    }

    public func part1() -> Int {
        input.reduce(0) {
            $0 + $1.1.rawValue + $1.1.scoreAgainst(opponent: $1.0)
        }
    }

    public func part2() -> Int {
        input2.reduce(0) {
            $0 + $1.1.rawValue + $1.1.moveAgainst(opponent: $1.0).rawValue
        }
    }
}
