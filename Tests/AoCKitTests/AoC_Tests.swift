import XCTest
@testable import AoCKit
import class Foundation.Bundle

final class AoCTests: XCTestCase {
    static let expectedError = "Expected error to be thrown"
    static let invalidError = "Invalid error thrown"
    static let expectedIlligalCharacter = "Expected illigal character"

    // MARK: - Day 1
    let day1Input = """
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
"""

    func testDay1Part1() {
        XCTAssertEqual(Day1(input: day1Input).part1(), 24000)
        XCTAssertEqual(Day1(input: "a").part1(), 0)
    }

    func testDay1Part2() {
        XCTAssertEqual(Day1(input: day1Input).part2(), 45000)
    }

    // MARK: - Day 2
    let day2Input = """
A Y
B X
C Z
"""

    func testDay2Part1() throws {
        XCTAssertEqual(try Day2(input: day2Input).part1(), 15)

        XCTAssertThrowsError(try Day2(input: "D X").part1()) { error in
            XCTAssertEqual(error as! Day2.Move.Error, Day2.Move.Error.invalidOpponentMove("D"))
        }

        XCTAssertThrowsError(try Day2(input: "A W").part1()) { error in
            XCTAssertEqual(error as! Day2.Move.Error, Day2.Move.Error.invalidPlayerMove("W"))
        }

        XCTAssertNotEqual(Day2.Move.Error.invalidPlayerMove("A"), Day2.Move.Error.invalidOpponentMove("A"))
    }

    func testDay2Part2() {
        XCTAssertEqual(try Day2(input: day2Input).part2(), 12)
    }

    // MARK: - Day 3
    let day3input = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""

    func testDay3Part1() {
        XCTAssertEqual(Day3(input: day3input).part1(), 157)
    }

    func testDay3Part2() {
        XCTAssertEqual(Day3(input: day3input).part2(), 70)
    }

    // MARK: - Day 4
    let day4Input = """
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"""

    func testDay4Part1() {
        XCTAssertEqual(Day4(input: day4Input).part1(), 2)
    }

    func testDay4Part2() {
        XCTAssertEqual(Day4(input: day4Input).part2(), 4)
    }

// MARK: - Day 5
    let day5Input = """
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
"""

    func testDat5Init() {
        XCTAssertNil(Day5.Move(""))
    }

    func testDay5Part1() {
        XCTAssertEqual(Day5(input: day5Input).part1(), "CMZ")
    }

    func testDay5Part2() {
        XCTAssertEqual(Day5(input: day5Input).part2(), "MCD")
    }

    // MARK: - Day 6
    let day6Input = """
mjqjpqmgbljsphdztnvjfqwrcgsmlb
"""

    func testDay6Part1() {
        XCTAssertEqual(Day6(input: day6Input).part1(), 7)
        XCTAssertEqual(Day6(input: "bvwbjplbgvbhsrlpgdmjqwftvncz").part1(), 5)
        XCTAssertEqual(Day6(input: "nppdvjthqldpwncqszvftbrmjlhg").part1(), 6)
        XCTAssertEqual(Day6(input: "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg").part1(), 10)
        XCTAssertEqual(Day6(input: "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw").part1(), 11)
        XCTAssertEqual(Day6(input: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").part1(), -1)
        XCTAssertEqual(Day6(input: "").part1(), -1)
    }

    func testDay6Part2() {
        XCTAssertEqual(Day6(input: day6Input).part2(), 19)
        XCTAssertEqual(Day6(input: "bvwbjplbgvbhsrlpgdmjqwftvncz").part2(), 23)
        XCTAssertEqual(Day6(input: "nppdvjthqldpwncqszvftbrmjlhg").part2(), 23)
        XCTAssertEqual(Day6(input: "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg").part2(), 29)
        XCTAssertEqual(Day6(input: "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw").part2(), 26)
        XCTAssertEqual(Day6(input: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").part2(), -1)
        XCTAssertEqual(Day6(input: "").part2(), -1)
    }

    // MARK: - Day 7
    let day7Input = """
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
"""

    func testDay7Part1() {
        XCTAssertEqual(Day7(input: day7Input).part1(), 95437)
    }

    func testDay7Part2() {
        XCTAssertEqual(Day7(input: day7Input).part2(), 24933642)
    }

    // MARK: - Day 8
    let day8Input = """
30373
25512
65332
33549
35390
"""

    func testDay8Part1() {
        XCTAssertEqual(Day8(input: day8Input).part1(), 21)
    }

    func testDay8Part2() {
        XCTAssertEqual(Day8(input: day8Input).part2(), 8)
    }

    // MARK: - Day 9
    let day9Input = """
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2
"""

    func testDay9Part1() {
        XCTAssertEqual(Day9(input: day9Input).part1(), 13)
    }

    func testDay9Part2() {
        XCTAssertEqual(Day9(input: day9Input).part2(), 1)
    }

    let day10Input = """
"""

    func testDay10Part1() {
        XCTAssertEqual(Day10(input: day10Input).part1(), 0)
    }

    func testDay10Part2() {
        XCTAssertEqual(Day10(input: day10Input).part2(), 0)
    }

    let day11Input = """
"""

    func testDay11Part1() {
        XCTAssertEqual(Day11(input: day11Input).part1(), 0)
    }

    func testDay11Part2() {
        XCTAssertEqual(Day11(input: day11Input).part2(), 0)
    }

    let day12Input = """
Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi
"""

    func testDay12Part1() {
        XCTAssertEqual(Day12(input: day12Input).part1(), 31)
    }

    func testDay12Part2() {
        XCTAssertEqual(Day12(input: day12Input).part2(), 0)
    }

    let day13Input = """
[1,1,3,1,1]
[1,1,5,1,1]

[[1],[2,3,4]]
[[1],4]

[9]
[[8,7,6]]

[[4,4],4,4]
[[4,4],4,4,4]

[7,7,7,7]
[7,7,7]

[]
[3]

[[[]]]
[[]]

[1,[2,[3,[4,[5,6,7]]]],8,9]
[1,[2,[3,[4,[5,6,0]]]],8,9]
"""

    func testDay13Part1() {
        XCTAssertEqual(Day13(input: day13Input).part1(), 13)
    }

    func testDay13Part2() {
        XCTAssertEqual(Day13(input: day13Input).part2(), 0)
    }

    let day14Input = """
498,4 -> 498,6 -> 496,6
503,4 -> 502,4 -> 502,9 -> 494,9
"""

    func testDay14Part1() {
        XCTAssertTrue(Day14(input: day14Input).walls.contains(Position(x: 494, y: 9)))
        XCTAssertTrue(Day14(input: day14Input).walls.contains(Position(x: 503, y: 4)))
        XCTAssertTrue(Day14(input: day14Input).walls.contains(Position(x: 500, y: 9)))
        XCTAssertTrue(Day14(input: day14Input).walls.contains(Position(x: 498, y: 5)))
        XCTAssertTrue(Day14(input: day14Input).walls.contains(Position(x: 498, y: 6)))
        XCTAssertFalse(Day14(input: day14Input).walls.contains(Position(x: 494, y: 8)))
        XCTAssertFalse(Day14(input: day14Input).walls.contains(Position(x: 494, y: 10)))
        XCTAssertFalse(Day14(input: day14Input).walls.contains(Position(x: 504, y: 4)))
        XCTAssertFalse(Day14(input: day14Input).walls.contains(Position(x: 503, y: 5)))

        XCTAssertEqual(Day14(input: day14Input).lowestY, 9)

        XCTAssertEqual(Day14(input: day14Input).part1(), 24)
    }

    func testDay14Part2() {
        XCTAssertEqual(Day14(input: day14Input).part2(), 93)
    }

    let day15Input = """
Sensor at x=2, y=18: closest beacon is at x=-2, y=15
Sensor at x=9, y=16: closest beacon is at x=10, y=16
Sensor at x=13, y=2: closest beacon is at x=15, y=3
Sensor at x=12, y=14: closest beacon is at x=10, y=16
Sensor at x=10, y=20: closest beacon is at x=10, y=16
Sensor at x=14, y=17: closest beacon is at x=10, y=16
Sensor at x=8, y=7: closest beacon is at x=2, y=10
Sensor at x=2, y=0: closest beacon is at x=2, y=10
Sensor at x=0, y=11: closest beacon is at x=2, y=10
Sensor at x=20, y=14: closest beacon is at x=25, y=17
Sensor at x=17, y=20: closest beacon is at x=21, y=22
Sensor at x=16, y=7: closest beacon is at x=15, y=3
Sensor at x=14, y=3: closest beacon is at x=15, y=3
Sensor at x=20, y=1: closest beacon is at x=15, y=3
"""

    func testDay15Part1() {
        XCTAssertEqual(Day15(input: day15Input).positionsCount(row: 10), 26)
    }

    func testDay15Part2() {
        XCTAssertEqual(Day15(input: day15Input).emptyPosition(between: 0, and: 20)!.frequency, 56000011)
    }


    let day16Input = """
"""

    func testDay16Part1() {
        XCTAssertEqual(Day16(input: day16Input).part1(), 0)
    }

    func testDay16Part2() {
        XCTAssertEqual(Day16(input: day16Input).part2(), 0)
    }

    let day17Input = """
"""

    func testDay17Part1() {
        XCTAssertEqual(Day17(input: day17Input).part1(), 0)
    }

    func testDay17Part2() {
        XCTAssertEqual(Day17(input: day17Input).part2(), 0)
    }

    let day18Input = """
"""

    func testDay18Part1() {
        XCTAssertEqual(Day18(input: day18Input).part1(), 0)
    }

    func testDay18Part2() {
        XCTAssertEqual(Day18(input: day18Input).part2(), 0)
    }

    let day19Input = """
"""

    func testDay19Part1() {
        XCTAssertEqual(Day19(input: day19Input).part1(), 0)
    }

    func testDay19Part2() {
        XCTAssertEqual(Day19(input: day19Input).part2(), 0)
    }

    let day20Input = """
"""

    func testDay20Part1() {
        XCTAssertEqual(Day20(input: day20Input).part1(), 0)
    }

    func testDay20Part2() {
        XCTAssertEqual(Day20(input: day20Input).part2(), 0)
    }

    let day21Input = """
"""

    func testDay21Part1() {
        XCTAssertEqual(Day21(input: day21Input).part1(), 0)
    }

    func testDay21Part2() {
        XCTAssertEqual(Day21(input: day21Input).part2(), 0)
    }

    let day22Input = """
"""

    func testDay22Part1() {
        XCTAssertEqual(Day22(input: day22Input).part1(), 0)
    }

    func testDay22Part2() {
        XCTAssertEqual(Day22(input: day22Input).part2(), 0)
    }

    let day23Input = """
"""

    func testDay23Part1() {
        XCTAssertEqual(Day23(input: day23Input).part1(), 0)
    }

    func testDay23Part2() {
        XCTAssertEqual(Day23(input: day23Input).part2(), 0)
    }

    let day24Input = """
"""

    func testDay24Part1() {
        XCTAssertEqual(Day24(input: day24Input).part1(), 0)
    }

    func testDay24Part2() {
        XCTAssertEqual(Day24(input: day24Input).part2(), 0)
    }

    let day25Input = """
"""

    func testDay25Part1() {
        XCTAssertEqual(Day25(input: day25Input).part1(), 0)
    }

    func testDay25Part2() {
        XCTAssertEqual(Day25(input: day25Input).part2(), 0)
    }
}
