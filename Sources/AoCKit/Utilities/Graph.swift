import Foundation

class Node<Name> where Name: Comparable & Hashable {
    var name: Name

    internal init(name: Name) {
        self.name = name
    }
}

struct Edge<Name>: Equatable where Name: Comparable & Hashable {
    let left: Name
    let right: Name
    let weight: Int
    let directional: Bool

    init(left: Name, right: Name, weight: Int = 1, directional: Bool = false) {
        self.left = left
        self.right = right
        self.weight = weight
        self.directional = directional
    }

    func connection(from name: Name) -> Name {
        left == name ? right : left
    }
}

protocol Graph<Name> where Name: Comparable & Hashable {
    associatedtype Name

    var nodes: [Node<Name>] { get }
    var edges: [Edge<Name>] { get }
}

extension Graph {
    func node(with name: Name) -> Node<Name> {
        nodes.first { $0.name == name }!
    }

    func edges(connectedTo name: Name) -> [Edge<Name>] {
        edges
            .filter { $0.left == name || $0.right == name }
    }

    func djikstraShortestPaths(from startNode: Name) -> [Name: Int] {
        var unvisited = nodes.map { $0.name }
        var weights: [Name: Int] = nodes.reduce([Name: Int]()) {
            $0.setting(key: $1.name, value: Int.max)
        }

        weights[startNode] = 0

        while !unvisited.isEmpty {
            let current = unvisited.first!

            edges(connectedTo: current)
                .forEach {
                    let to = $0.connection(from: current)
                    let possibleWeight = $0.weight + weights[current]!

                    if weights[to]! > possibleWeight {
                        weights[to] = possibleWeight
                    }
                }

            unvisited.removeFirst()
        }

        return weights
    }
}
