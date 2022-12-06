import Algorithms
import Foundation

public final class Day6: Day {
    let input: [Character]

    public init(input: String) {
        self.input = input.map { $0 }
    }

    func marker(uniqueCharacters: Int) -> Int {
        (
            (0 ..< max(0, input.count - uniqueCharacters))
            .first {
                Set(input[$0 ..< $0 + uniqueCharacters]).count == uniqueCharacters
            } ?? (-uniqueCharacters - 1)
        ) + uniqueCharacters
    }

    public func part1() -> Int {
        marker(uniqueCharacters: 4)
    }

    public func part2() -> Int {
        marker(uniqueCharacters: 14)
    }
}
