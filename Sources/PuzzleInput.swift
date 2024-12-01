import Foundation

struct PuzzleInput {
    let part1: String
    let part2: String

    init(day: String) throws {
        guard let firstPart = Bundle.module.url(forResource: "\(day)-01", withExtension: "txt") else { throw URLError(.fileDoesNotExist) }
        guard let secondPart = Bundle.module.url(forResource: "\(day)-02", withExtension: "txt") else { throw URLError(.fileDoesNotExist) }
        self.part1 = try String(contentsOf: firstPart, encoding: .utf8)
        self.part2 = try String(contentsOf: secondPart, encoding: .utf8)
    }

    init(part1: String? = nil, part2: String? = nil) {
        self.part1 = part1 ?? "NOT SET"
        self.part2 = part2 ?? "NOT SET"
    }
}
