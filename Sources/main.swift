// The Swift Programming Language
// https://docs.swift.org/swift-book

let challenge = Day01(input: try! PuzzleInput(day: "Day01"))

let a = try await challenge.part01()
print("Part 1: \(a)")

let b = try await challenge.part02()
print("Part 2: \(b)")
