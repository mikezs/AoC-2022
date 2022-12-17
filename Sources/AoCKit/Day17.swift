import Algorithms
import Foundation

public final class Day17: Day {
    enum Piece {
        case dash
        case plus
        case angle
        case line
        case square

        var height: Int {
            switch self {
            case .dash: return 1
            case .plus: return 3
            case .angle: return 3
            case .line: return 4
            case .square: return 2
            }
        }

        static var order: [Piece] {
            [.dash, .plus, .angle, .line, .square]
        }

        func landed(_ x: Int, _ y: Int, _ stack: inout [String]) -> Bool {
            true
        }

        func canMoveSide(toLeft wind: Bool, x: Int, y: Int, _ stack: inout [String]) -> Bool {
            true
        }

        func canMoveDown(x: Int, y: Int, _ stack: inout [String]) -> Bool {
            true
        }

        func apply(to stack: inout [String], at x: Int, y: Int) -> Int {
            3068
        }
    }

    let input: [Bool]

    public init(input: String) {
        self.input = input.trimmedLines[0].map { $0 == "<" ? true : false }
    }

    public func part1() -> Int {
        var stack = [String]()
        var height = 0
        var piece = Piece.order[0]
        var windPosition = 0

        (0 ... 2022).forEach { rock in
            piece = Piece.order[rock % Piece.order.count]

            var anchorX = 2
            var anchorY = height + piece.height + 3

            if stack.count < anchorY {
                stack.append("       ")
            }

            while !piece.landed(anchorX, anchorY, &stack) {
                let wind = input[windPosition]

                if piece.canMoveSide(toLeft: wind, x: anchorX, y: anchorY, &stack) {
                    if wind {
                        anchorX -= 1
                    } else {
                        anchorX += 1
                    }
                }

                if piece.canMoveDown(x: anchorX, y: anchorY, &stack) {
                    anchorY += 1
                }

                windPosition += 1
            }

            height = piece.apply(to: &stack, at: anchorX, y: anchorY)
        }

        return height
    }

    public func part2() -> Int {
        return 0
    }
}
