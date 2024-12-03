//
// Copyright © 2024 Storytel AB. All rights reserved.
//
struct Day02: Puzzle {
    let input: PuzzleInput

    func part01() async throws -> Int {
        let reports: [[Int]] = input.part1
            .split { $0.isNewline }
            .map { line in
                line
                    .split { $0.isWhitespace }
                    .map { Int($0)! }
            }
        return reports.reduce(0) { result, report in
            if report.isSortedIncreasing() || report.isSortedDecreasing() {
                return result + 1
            }
            return result
        }
    }

    func part02() async throws -> Int {
        return 0
    }
}

extension Array where Element == Int {
//        The levels are either all increasing or all decreasing.
//        Any two adjacent levels differ by at least one and at most three.
    func isSortedIncreasing() -> Bool {
        var previous: Int?
        for element in self {
            if let previous {
                if previous < element {
                    return false
                } else if !(1...3).contains(abs(previous.distance(to: element))) {
                    return false
                }
            }
            previous = element
        }
        return true
    }

    func isSortedDecreasing() -> Bool {
        var previous: Int?
        for element in self {
            if let previous {
                if previous > element {
                    return false
                } else if !(1...3).contains(abs(previous.distance(to: element))) {
                    return false
                }
            }
            previous = element
        }
        return true
    }
}
