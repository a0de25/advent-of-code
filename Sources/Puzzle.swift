protocol Puzzle {
    associatedtype Value
    var input: PuzzleInput { get }
    func part01() async throws -> Value
    func part02() async throws -> Value
}
