import XCTest
@testable import AoCKit

final class GraphTests: XCTestCase {
    class TestGraph: Graph {
        let nodes = [
            Node(name: 0),
            Node(name: 1),
            Node(name: 2),
            Node(name: 3),
            Node(name: 4),
            Node(name: 5),
            Node(name: 6)
        ]

        let edges = [
            Edge(left: 0, right: 1, weight: 2),
            Edge(left: 0, right: 2, weight: 6),
            Edge(left: 1, right: 3, weight: 5),
            Edge(left: 2, right: 3, weight: 8),
            Edge(left: 3, right: 5, weight: 15),
            Edge(left: 3, right: 4, weight: 10),
            Edge(left: 5, right: 4, weight: 6),
            Edge(left: 5, right: 6, weight: 6),
            Edge(left: 4, right: 6, weight: 2)
        ]
    }

    func testEdges() {
        XCTAssertEqual(TestGraph().edges(connectedTo: 0), [Edge(left: 0, right: 1, weight: 2),
                                                           Edge(left: 0, right: 2, weight: 6)])
        XCTAssertEqual(TestGraph().edges(connectedTo: 3), [Edge(left: 1, right: 3, weight: 5),
                                                           Edge(left: 2, right: 3, weight: 8),
                                                           Edge(left: 3, right: 5, weight: 15),
                                                           Edge(left: 3, right: 4, weight: 10)])
        XCTAssertEqual(TestGraph().edges(connectedTo: 6), [Edge(left: 5, right: 6, weight: 6),
                                                           Edge(left: 4, right: 6, weight: 2)])
    }

    func testDjikstra() {
        // https://www.freecodecamp.org/news/dijkstras-shortest-path-algorithm-visual-introduction/
        XCTAssertEqual(TestGraph().djikstraShortestPaths(from: 0),
                       [
                        0: 0,
                        1: 2,
                        2: 6,
                        3: 7,
                        4: 17,
                        5: 22,
                        6: 19
                       ])
    }
}
