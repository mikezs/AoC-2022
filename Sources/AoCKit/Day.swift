import Foundation

enum Error: Swift.Error {
    case invalidInput
}

public protocol Day<T> {
    associatedtype T
    init(input: String) throws
    func part1() throws -> T
    func part2() throws -> T
}
