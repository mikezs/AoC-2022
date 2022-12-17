import Algorithms
import Foundation

public final class Day16: Day {
    typealias ValveID = String

    class Valve {
        let name: ValveID
        let rate: Int
        let tunnels: [String]

        var nodeWeights: [ValveID: Int] {
            tunnels.reduce([ValveID: Int]()) { $0.setting(key: $1, value: 1) }
        }

        init(name: String, rate: Int, tunnels: [String]) {
            self.name = name
            self.rate = rate
            self.tunnels = tunnels
        }
    }

    let input: [Valve]
    let distances: [ValveID: [ValveID: Int]]

    public init(input: String) {
        self.input = input
            .trimmedLines
            .map { $0.components(separatedBy: " ") }
            .map {
                let name = $0[1]
                let rate = Int($0[4].components(separatedBy: "=")[1].replacingOccurrences(of: ";", with: ""))!
                let tunnels = Array($0[9..<$0.count]).map { $0.replacingOccurrences(of: ",", with: "") }

                return Valve(name: name, rate: rate, tunnels: tunnels)
            }

        distances = [ValveID: [ValveID: Int]]()

//        self.input
//            .sorted { $0.name < $1.name }
//            .forEach {
//
//            }

    }

    public func part1() -> Int {
        var openValves = [String]()

        return input
            .filter { openValves.contains($0.name) }
            .reduce(0) { $0 + $1.rate }
    }

    public func part2() -> Int {
        0
    }
}
