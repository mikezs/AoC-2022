import Foundation

extension String {
    var trimmedLines: [String] { trimmingCharacters(in: .newlines).components(separatedBy: .newlines) }
    var trimmedInts: [Int] { trimmedLines.compactMap { Int($0) } }
    var commaSeparatedInts: [Int] { trimmingCharacters(in: .newlines).components(separatedBy: ",").compactMap { Int($0) } }
}

extension String {
    var binaryAsInt: Int? { Int(self, radix: 2) }
    var isLowercase: Bool { lowercased() == self }
    var isUppercase: Bool { uppercased() == self }
    var ord: Int? { first?.ord }

    func replacing(at offset: Int, with newValue: Character) -> String {
        var chars = Array(self)
        chars[offset] = newValue
        return String(chars)
    }

    func replacing(pairs: [(Character, Character)]) -> String {
        var result = self

        pairs.forEach { (find, replace) in
            enumerated().forEach { (offset, element) in
                if element == find {
                    result = result.replacing(at: offset, with: replace)
                }
            }
        }

        return result
    }

    func removingLast() -> String {
        var string = self
        string.removeLast()
        return string
    }

    func removingFirst() -> String {
        var string = self
        string.removeFirst()
        return string
    }
}

// https://stackoverflow.com/a/24144365
extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
}
