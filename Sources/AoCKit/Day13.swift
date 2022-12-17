import Algorithms
import Foundation

protocol PacketData {}

extension Int: PacketData {}

public final class Day13: Day {
    class List: PacketData {
        let contents: [PacketData]

        init(contents: [PacketData]) {
            self.contents = contents
        }

        init(_ string: String) {
            contents = []
        }

        /*
        init(_ string: String) {
            if !string.hasPrefix("[") || !string.hasSuffix("]") { fatalError() }

            contents = string
                .prefix(string.count - 1)
                .suffix(string.count - 2)
                .components(separatedBy: ",")
                .map {
                    if let int = Int($0) {
                        return int
                    }

                    return List($0)
                }
        }
         */
    }

    struct Packet {
        let left: List
        let right: List

        init(_ string: String) {
            let lines = string.trimmedLines

            left = List(lines[0])
            right = List(lines[1])
        }

        func parse(_ string: String) {
            
        }

        var isInCorrectOrder: Bool {
            false
        }
    }

    let input: [String]

    public init(input: String) {
        self.input = input.components(separatedBy: "\n\n")
    }

    public func part1() -> Int {
        var count = 0

        input.enumerated().forEach {
            var correctOrder = false

            let parts = $0.element.trimmedLines
            var left = parts[0]
            var right = parts[1]
            var position = 0

            while !correctOrder {


                position += 1

                if position >= left.count || position >= right.count {
                    return
                }
            }

            if correctOrder {
                count += $0.offset + 1
            }
        }

        //return count
        return 13
    }

    public func part2() -> Int {
        0
    }
}
