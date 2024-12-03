import Testing
@testable import aoc

class AdventOfCodeTests {
    let input = PuzzleInput(
        part1:
"""
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
""",
        part2:
"""
"""
    )

    lazy var sut = Day02(input: input)

    @Test func testPartOne() async throws {
        let result = try await sut.part01()
        #expect(result == 2)
    }

    @Test(.disabled()) func testPartTwo() async throws {
        let result = try await sut.part02()
        #expect(result == 1)
    }
}
