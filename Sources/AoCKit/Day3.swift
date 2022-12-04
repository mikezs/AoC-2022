import Algorithms
import Foundation

extension Array where Element == Day3.Rucksack {
    var badge: Character {
        let sets = map { Set($0.one + $0.two) }

        return sets.reduce(sets.first!) {
            $0.intersection($1)
        }.first!
    }
}

fileprivate extension Character {
    var priority: Int {
        var priority = 0

        if Character(uppercased()) == self {
            priority = ord! - "A".ord! + 26 + 1
        } else if Character(lowercased()) == self {
            priority = ord! - "a".ord! + 1
        }

        return priority
    }
}

public final class Day3: Day {
    struct Rucksack {
        let one: [Character]
        let two: [Character]
    }

    let input: [Rucksack]

    public init(input: String) {
        self.input = input.trimmedLines.compactMap {
            let compartmentSize = $0.count / 2
            return Rucksack(
                one: Array($0.prefix(compartmentSize)),
                two: Array($0.suffix(compartmentSize)))
        }
    }

    public func part1() -> Int {
        input
            .map { rucksack -> Int in
                Set(rucksack.one)
                    .intersection(Set(rucksack.two))
                    .reduce(0) { $0 + $1.priority }
            }
            .reduce(0, +)
    }

    public func part2() -> Int {
        input
            .chunks(ofCount: 3)
            .map { Array($0).badge.priority }
            .reduce(0, +)
    }
}
