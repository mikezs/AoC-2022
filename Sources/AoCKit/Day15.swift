import Algorithms
import Foundation

struct Sensor {
    let position: Position
    let nearestBeacon: Position
    let distance: Int

    init(position: Position, nearestBeacon: Position) {
        self.position = position
        self.nearestBeacon = nearestBeacon

        distance = position.manhattenDistance(to: nearestBeacon)
    }

    func withinDistance(point: Position) -> Bool {
        distance >= position.manhattenDistance(to: point)
    }

    var minX: Int {
        position.x - distance
    }

    var maxX: Int {
        position.x + distance
    }
}

extension Position {
    func manhattenDistance(to: Position) -> Int {
        abs(x - to.x) + abs(y - to.y)
    }

    var frequency: Int {
        (x * 4000000) + y
    }
}

public final class Day15: Day {
    let input: [Sensor]

    public init(input: String) {
        self.input = input
            .trimmedLines
            .map {
                let parts = $0.components(separatedBy: " ")

                let sensorX = Int(parts[2].removingLast().components(separatedBy: "=")[1])!
                let sensorY = Int(parts[3].removingLast().components(separatedBy: "=")[1])!
                let beaconX = Int(parts[8].removingLast().components(separatedBy: "=")[1])!
                let beaconY = Int(parts[9].components(separatedBy: "=")[1])!

                return Sensor(position: Position(x: sensorX, y: sensorY),
                              nearestBeacon: Position(x: beaconX, y: beaconY))
            }
    }

    func positionsCount(row: Int) -> Int {
        var count = 0
        let minX = input.reduce(Int.max) { min($0, $1.minX) }
        let maxX = input.reduce(Int.min) { max($0, $1.maxX) }

        (minX ... maxX).forEach {
            let position = Position(x: $0, y: row)

            var found = false
            var beacon = false

            for sensor in input where !beacon {
                if sensor.nearestBeacon == position {
                    beacon = true
                }

                if found || sensor.withinDistance(point: position) {
                    found = true
                }
            }

            if found && !beacon {
                count += 1
            }
        }

        return count
    }

    func emptyPosition(between min: Int, and max: Int) -> Position? {
        for sensor in input {
            let distance = sensor.distance + 1

            positionLoop:
            for offset in (-distance ... distance) {
                for sign in [-1, 1] {
                    let yChange = (distance - abs(offset)) * sign

                    let position = Position(x: sensor.position.x + offset, y: sensor.position.y + yChange)

                    if position.x < min || position.x > max || position.y < min || position.y > max {
                        continue
                    }

                    // sanity check
                    //assert(sensor.position.manhattenDistance(to: position) == distance)

                    for check in input {
                        if check.withinDistance(point: position) {
                            continue positionLoop
                        }
                    }

                    return position
                }
            }
        }

        return nil
    }

    public func part1() -> Int {
        positionsCount(row: 2000000)
    }

    public func part2() -> Int {
        emptyPosition(between: 0, and: 4000000)!.frequency
    }
}
