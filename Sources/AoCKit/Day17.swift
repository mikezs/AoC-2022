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

        /// The first item in the array is a left-most and last is a right-most
        var positions: [(Int,Int)] {
            switch self {
            case .dash: return [(0,0),(1,0),(2,0),(3,0)]
            case .plus: return [(0,-1),(1,0),(1,-1),(1,-2),(2,-1)]
            case .angle: return [(0,-2),(1,-2),(2,-2),(2,-1),(2,0)]
            case .line: return [(0,0),(0,-1),(0,-2),(0,-3)]
            case .square: return [(0,0),(0,-1),(1,0),(1,-1)]
            }
        }

        static var order: [Piece] {
            [.dash, .plus, .angle, .line, .square]
        }

        func landed(_ x: Int, _ y: Int, _ stack: inout [String]) -> Bool {
            for position in positions {
                if y + position.1 < 0 {
                    return true
                }

                if stack[safe: y + position.1]?[x + position.0] != "." {
                    return true
                }
            }

            return false
        }

        func moveSide(toLeft wind: Bool, x: Int, y: Int, _ stack: inout [String]) -> (Int, Int) {
            var canMove = true

            for position in positions where canMove {
                if wind, x + position.0 - 1 < 0 {
                    canMove = false
                }

                if !wind, x + position.0 + 1 > 6 {
                    canMove = false
                }

                if wind, stack[y + position.1][safe: x + position.0 - 1] == "#" {
                    canMove = false
                }

                if !wind, stack[y + position.1][safe: x + position.0 + 1] == "#" {
                    canMove = false
                }
            }

            if canMove {
                if wind {
                    return (x - 1, y)
                } else {
                    return (x + 1, y)
                }
            }

            return (x, y)
        }

        func apply(to stack: inout [String], at x: Int, y: Int) {
            for position in positions {
                let row = y + position.1

                stack[row] = stack[row].replacing(at: x + position.0, with: "#")
            }
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

        (0 ..< 2022).forEach { rock in
            piece = Piece.order[rock % Piece.order.count]

            var anchorX = 2
            var anchorY = height + piece.height + 2

            while stack.count <= anchorY + 1 {
                stack.append(".......")
            }

            repeat {
                let result = piece.moveSide(toLeft: input[windPosition], x: anchorX, y: anchorY, &stack)
                anchorX = result.0
                anchorY = result.1
                windPosition = (windPosition + 1) % input.count

                anchorY -= 1
            } while !piece.landed(anchorX, anchorY, &stack)

            anchorY += 1

            piece.apply(to: &stack, at: anchorX, y: anchorY)

            height = (0..<stack.count).reversed().first { stack[$0].contains("#") }! + 1
        }

        return height
    }

    public func part2() -> Int {
        0
    }
}
