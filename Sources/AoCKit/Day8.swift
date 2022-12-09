import Algorithms
import Foundation

public final class Day8: Day {
    class Tree {
        init(_ value: Character, visible: [Day8.Tree.Visibility] = []) {
            self.value = Int(String(value))!
            self.visible = visible
        }

        enum Visibility {
            case left, right, top, bottom
        }

        let value: Int
        var visible: [Visibility] = []
        var scenicScore = 0

        var isVisible: Bool {
            visible.count > 0
        }
    }

    let input: [[Tree]]

    public init(input: String) {
        self.input = input.trimmedLines.map { $0.compactMap { Tree($0) } }
    }

    public func part1() -> Int {
        let trees = input

        let perimeterCount = (trees.count * 2) + (trees.count * 2) - 4

        var visibleTrees = 0

        for y in 1 ..< trees.count - 1 {
            for x in 1 ..< trees[y].count - 1 {
                let current = trees[y][x]
                current.visible = [.top, .left, .bottom, .right]

                var position = x - 1
                while position >= 0, current.visible.contains(.left) {
                    if trees[y][position].value >= current.value {
                        current.visible.removeAll { $0 == .left }
                    }
                    position -= 1
                }

                position = x + 1
                while position < trees[y].count, current.visible.contains(.right) {
                    if trees[y][position].value >= current.value {
                        current.visible.removeAll { $0 == .right }
                    }
                    position += 1
                }

                position = y - 1
                while position >= 0, current.visible.contains(.top) {
                    if trees[position][x].value >= current.value {
                        current.visible.removeAll { $0 == .top }
                    }
                    position -= 1
                }

                position = y + 1
                while position < trees.count, current.visible.contains(.bottom) {
                    if trees[position][x].value >= current.value {
                        current.visible.removeAll { $0 == .bottom }
                    }
                    position += 1
                }

                if current.isVisible {
                    visibleTrees += 1
                }
            }
        }

        return visibleTrees + perimeterCount
    }

    public func part2() -> Int {
        let trees = input

        for y in 0 ..< trees.count {
            for x in 0 ..< trees[y].count {
                let current = trees[y][x]

                var leftScore = 0, rightScore = 0, topScore = 0, bottomScore = 0

                var position = x - 1
                while position >= 0 {
                    leftScore += 1

                    if trees[y][position].value >= current.value {
                        break
                    }

                    position -= 1
                }

                position = x + 1
                while position < trees[y].count {
                    rightScore += 1

                    if trees[y][position].value >= current.value {
                        break
                    }

                    position += 1
                }

                position = y - 1
                while position >= 0 {
                    topScore += 1

                    if trees[position][x].value >= current.value {
                        break
                    }

                    position -= 1
                }

                position = y + 1
                while position < trees.count {
                    bottomScore += 1

                    if trees[position][x].value >= current.value {
                        break
                    }

                    position += 1
                }

                current.scenicScore = leftScore * rightScore * topScore * bottomScore
            }
        }

        return trees.flatMap { $0.map { $0.scenicScore } }.max()!
    }
}
