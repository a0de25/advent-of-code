import Foundation
import RegexBuilder

struct Day03 {
    func part01(_ input: String) async throws -> Int {
        // xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
        //  mul(2,4)                    mul(5,5)                mul(11,8)mul(8,5)
        //      2*4                         5*5                     11*8     8*5
        //      8                           25                      88       40
        // -----------------------------------------------------------------------
        //                                                                   161
        return input
            .matches(of: /mul\((\d+),(\d+)\)/)
            .map(\.output)
            .map { _, a, b in
                Int(a)! * Int(b)!
            }
            .reduce(0, +)
    }

    func part02(_ input: String) async throws -> Int {
        let includeRegex = /do\(\)/
        let excludeRegex = /don't\(\)/
        let instructionRegex = /mul\((\d+),(\d+)\)/

        let regex = Regex {
            ChoiceOf {
                includeRegex
                excludeRegex
                instructionRegex
            }
        }

        var isInstructionAllowed = true
        var total = 0
        for match in input.matches(of: regex).map(\.output.0) {
            if let _ = match.firstMatch(of: excludeRegex) {
                isInstructionAllowed = false
            } else if let _ = match.firstMatch(of: includeRegex) {
                isInstructionAllowed = true
            } else if let instruction = match.firstMatch(of: instructionRegex), isInstructionAllowed {
                let (_, a, b) = instruction.output
                total += Int(a)! * Int(b)!
            }
        }

        return total
    }
}
