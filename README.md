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
