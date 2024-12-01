struct Day01: Puzzle {
    let input: PuzzleInput

    func part01() async throws {
        let pairs: [(Int, Int)] = input.part1
            .split(separator: "\n")
            .map { str in
                let values = str.split(separator: "   ")
                return (Int(values[0])!, Int(values[1])!)
            }

        let firstColumnSorted = pairs.map { $0.0 }.sorted()
        let secondColumnSorted = pairs.map { $0.1 }.sorted()

        var sortedPairs: [(Int, Int)] = []
        for (index, _) in firstColumnSorted.enumerated() {
            sortedPairs.append((firstColumnSorted[index], secondColumnSorted[index]))
        }

        let result: Int = sortedPairs
            .reduce(0) { result, nextValue in
                let current = nextValue.0.distance(to: nextValue.1)
                return result + abs(current)
            }

        print(result)
    }

    func part02() async throws {
        let pairs: [(Int, Int)] = input.part2
            .split(separator: "\n")
            .map { str in
                let values = str.split(separator: "   ")
                return (Int(values[0])!, Int(values[1])!)
            }

        let firstColumn = pairs.map(\.0)
        let secondColumn = pairs.map(\.1)

        let similarityScores = firstColumn.map { value in
            let occurences = secondColumn.count { $0 == value }
            return value * occurences
        }

        let result = similarityScores.reduce(0, +)

        print(result)
    }
}
