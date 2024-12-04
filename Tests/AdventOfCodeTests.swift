import Testing
@testable import aoc

class AdventOfCodeTests {
    let sut = Day03()

    @Test func testPartOne() async throws {
        let result = try await sut.part01("xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))")
        #expect(result == 161)
    }

    @Test func testPartTwo() async throws {
        let result = try await sut.part02("xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))")
        #expect(result == 48)
    }
}
