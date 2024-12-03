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
        let reports: [[Int]] = input.part2
            .split { $0.isNewline }
            .map { line in
                line
                    .split { $0.isWhitespace }
                    .map { Int($0)! }
            }
        return reports.reduce(0) { result, report in
            if report.isSortedIncreasingAllowingOneBadValue() || report.isSortedDecreasingAllowingOneBadValue() {
                return result + 1
            }
            return result
        }
    }
}

extension Array where Element == Int {
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

    func isSortedIncreasingAllowingOneBadValue(failOnBadValue: Bool = false) -> Bool {
        for (index, _) in enumerated() {
            if index == endIndex - 1 {
                return true
            }

            let current = self[index]
            let nextIndex = index + 1
            let next = self[nextIndex]

            if (1...3).contains(current.distance(to: next)) {
                continue
            } else if failOnBadValue {
                return false
            } else {
                var bar = self
                bar.remove(at: index)
                var baz = self
                baz.remove(at: nextIndex)
                return bar.isSortedIncreasingAllowingOneBadValue(failOnBadValue: true) || baz.isSortedIncreasingAllowingOneBadValue(failOnBadValue: true)
            }

        }
        return false
    }

    func isSortedDecreasingAllowingOneBadValue(failOnBadValue: Bool = false) -> Bool {
        for (index, _) in enumerated() {
            if index == endIndex - 1 {
                return true
            }

            let current = self[index]
            let nextIndex = index + 1
            let next = self[nextIndex]
            if (1...3).contains(next.distance(to: current)) {
                continue
            } else if failOnBadValue {
                return false
            } else {
                var bar = self
                bar.remove(at: index)
                var baz = self
                baz.remove(at: nextIndex)
                return bar.isSortedDecreasingAllowingOneBadValue(failOnBadValue: true) || baz.isSortedDecreasingAllowingOneBadValue(failOnBadValue: true)
            }
        }
        return false
    }
}
