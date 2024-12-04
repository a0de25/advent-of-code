// The Swift Programming Language
// https://docs.swift.org/swift-book

let challenge = Day03()
let input = try! PuzzleInput(day: "Day03")

let a = try await challenge.part01(input.part1)
print("Part 1: \(a)")

let b = try await challenge.part02(input.part1)
print("Part 2: \(b)")
