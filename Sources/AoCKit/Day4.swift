import Algorithms
import Foundation

public final class Day4: Day {
    let input: [(ClosedRange<Int>, ClosedRange<Int>)]

    public init(input: String) {
        self.input = input
            .trimmedLines
            .compactMap {
                let ranges = $0.split(separator: ",")
                let range1 = ranges[0].split(separator: "-")
                let range2 = ranges[1].split(separator: "-")
                let final: (ClosedRange<Int>, ClosedRange<Int>) = (Int(range1[0])!...Int(range1[1])!, Int(range2[0])!...Int(range2[1])!)
                return final
            }
    }

    public func part1() -> Int {
        input
            .filter {
                $0.0.clamped(to: $0.1) == $0.0 ||
                $0.1.clamped(to: $0.0) == $0.1
            }
            .count
    }

    public func part2() -> Int {
        input
            .filter {
                $0.0.contains($0.1.lowerBound) ||
                $0.0.contains($0.1.upperBound) ||
                $0.1.contains($0.0.lowerBound) ||
                $0.1.contains($0.0.lowerBound)
            }
            .count
    }
}
