import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Array {
    mutating func append(_ optionalElement: Element?) {
        if let element = optionalElement {
            append(element)
        }
    }
}

extension Array where Element: Hashable {
    var mode: [Element] {
        let count = reduce([Element: Int](), { dict, element in
            var count = dict[element] ?? 0
            count += 1
            return dict.setting(key: element, value: count)
        })

        guard let max = count.values.sorted().last else { return [] }

        return count
            .filter { $0.value == max }
            .map { $0.key }
    }

    var counts: [Element: Int] {
        reduce([Element: Int]()) { $0.setting(key: $1, value: ($0[$1] ?? 0) + 1) }
    }
}

extension Array where Element: Collection, Element.Index == Int {
    func verticalSlice(_ index: Int) -> [Element.Iterator.Element] {
        reduce([Element.Iterator.Element](), { $0 + [$1[index]] })
    }
}
