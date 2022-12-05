# AoC-2022
[![swift workflow](https://github.com/mikezs/AoC-2022/actions/workflows/swift.yml/badge.svg)](https://github.com/mikezs/AoC-2022/actions)
[![codecov](https://codecov.io/gh/mikezs/AoC-2022/branch/develop/graph/badge.svg?token=64OZZEYDTF)](https://codecov.io/gh/mikezs/AoC-2022)
[![Sonarcloud Status](https://sonarcloud.io/api/project_badges/measure?project=mikezs_AoC-2022&metric=alert_status)](https://sonarcloud.io/dashboard?id=mikezs_AoC-2022)

## Advent Of Code (AoC) 2022

This are my solutions to the [Advent Of Code 2022](https://adventofcode.com/2022/) event. This year I've been playing along with [timsearle](https://github.com/timsearle/), please check out their solutions if you're interested.

### Project approach

This swift package manager project contains my MacOS command line tool, a framework with all of the logic to solve the puzzles and a test framework to validate against the AoC examples that are given in the puzzle descriptions.

The idea is to use the example problems/solutions provided in the puzzles to do TDD, but sometimes there are no examples that allow TDD.

This project requires a `config.swift` file to be created. This is the format of the file:

```
import Foundation

enum Config {
    static let year = 2022
    // This is the session cookie from your browser after logging in to https://adventofcode.com/
    static let session = "[TOKEN]"
}
```

### Running

To run day 1:
- Either create a file called day1.txt with your puzzle input, or add your AoC session cookie to the code and it'll be created automatically
- Then run `swift run AoC 1` in Terminal

## Implementation notes

### Day 1
Fairly trivial, the hardest part was parsing the input, but after that a few functional calls to spit the answer out.

### Day 2
Todays challenge was modelling the input, I'm sure there's a simpler way, but I ended up parsing everything into enums and having functions to get a score based on comparing. I wrote the truth tables out manually though and there's a way to use the `modulo` operator instead I'm certain. I might come back and try agian (Narrator: He didn't).

### Day 3
I had to write a few extensions to get the syntax that let me easily work out what I was doing, but after I'd done that I got some nice functional chains to work with to get the answer. I refactored many times to get types to resolve and I think there's too many force unwraps for my liking. Solutions worked first time though 🎉

### Day 4
I basically exploited Swift's `Range`s for this, so it was very easy once I'd parsed the input. I'd like to spend some more time parsing the input using functional chains rather than using a lot of temporary variables.  Update: Simon put me onto a built in function for Part 2, and I tried to implement functional chains, but initializing the tuple was tricky. Update 2: After reading Tim's implementation I have now refactored it into barely understandable functional chains. Perfect.

### Day 5
Todays was tricky parsing of the input and then the output was fairly trivial to get. Swift doesn't have the ability to split with a `String`, only a `Character` or `CharacterSet` so I used a temporary variable to flag if I encountered an empty line for speed. Then I reversed the stacks lines, `pop`ed the first line to get the count of stacks and initialised my 2 dimensional array, then used `chunked` to get each crate, checked if the Character at index 1 wasn't empty and built up an array for each stack. Moves were simply parsed into an `struct` so they could be accessed easily with names and a constructor to convert a string.

 The first part was then creating a mutable copy of the stacks, loop to move each crate and then build the output string (just realising I should have used `joined(by:)`).
 
 The second part was building an array of crates to move, reversed (so the last removed one goes back on last too) and then added back on to the appropriate stack.
 
 This is the first question I've seen that has a String as the output so I've refactored my project to have a generic `Day` protocol and an `associatedType` for the output (which is inferred from the `part1()` and `part2()` return types).

**Update:** I refactored my parsing to be a lot more functional and use less temporary variables. I also removed the ducplication for the final parts and moved the core logic to a closure
