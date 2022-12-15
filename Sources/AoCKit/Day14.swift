import Algorithms
import Foundation

struct Position: Hashable {
    let x: Int
    let y: Int
}

public final class Day14: Day {
    let input: [[(x: Int, y: Int)]]
    let walls: Set<Position>

    public init(input: String) {
        self.input = input
            .trimmedLines
            .map {
                $0.components(separatedBy: " -> ")
                    .map { $0.components(separatedBy: ",").compactMap { Int($0) } }
                    .map { ($0[0], $0[1]) }
                }

        var wallPositions = Set<Position>()

        for wall in self.input {
            for item in wall.prefix(wall.count - 1).enumerated() {
                let start = item.element
                let end = wall[item.offset + 1]

                if start.y == end.y {
                    (min(start.x, end.x) ... max(start.x, end.x)).forEach { wallPositions.insert(Position(x: $0, y: start.y)) }
                } else if start.x == end.x {
                    (min(start.y, end.y) ... max(start.y, end.y)).forEach { wallPositions.insert(Position(x: start.x, y: $0)) }
                }
            }
        }

        walls = wallPositions
    }

    lazy var lowestY: Int = {
        input.reduce(0) {
            max($0, $1.reduce(0) { max($0, $1.y) } )
        }
    }()

    func something(at: Position, sands: Set<Position>, infinite: Bool = true) -> Bool {
        walls.contains(at) || sands.contains(at) || (!infinite && at.y == lowestY + 2)
    }

    public func part1() -> Int {
        var sands = Set<Position>()
        var sand = Position(x: 500, y: 0)

        while sand.y < lowestY {
            sand = Position(x: 500, y: 0)

            while sand.y < lowestY {
                if !something(at: Position(x: sand.x, y: sand.y + 1), sands: sands) {
                    sand = Position(x: sand.x, y: sand.y + 1)
                } else if !something(at: Position(x: sand.x - 1, y: sand.y + 1), sands: sands) {
                    sand = Position(x: sand.x - 1, y: sand.y + 1)
                } else if !something(at: Position(x: sand.x + 1, y: sand.y + 1), sands: sands) {
                    sand = Position(x: sand.x + 1, y: sand.y + 1)
                } else {
                    sands.insert(sand)
                    break
                }
            }
        }

        return sands.count
    }

    public func part2() -> Int {
        var sands = Set<Position>()
        let start = Position(x: 500, y: 0)
        var sand = start

        while !sands.contains(start) {
            sand = start

            while !sands.contains(start) {
                if !something(at: Position(x: sand.x, y: sand.y + 1), sands: sands, infinite: false) {
                    sand = Position(x: sand.x, y: sand.y + 1)
                } else if !something(at: Position(x: sand.x - 1, y: sand.y + 1), sands: sands, infinite: false) {
                    sand = Position(x: sand.x - 1, y: sand.y + 1)
                } else if !something(at: Position(x: sand.x + 1, y: sand.y + 1), sands: sands, infinite: false) {
                    sand = Position(x: sand.x + 1, y: sand.y + 1)
                } else {
                    sands.insert(sand)
                    break
                }
            }
        }

        return sands.count
    }
}
