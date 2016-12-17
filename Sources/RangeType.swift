
public protocol RangeType {
    associatedtype Bound: Comparable

    init(uncheckedBounds bounds: (lower: Bound, upper: Bound))

    var lowerBound: Bound { get }
    var upperBound: Bound { get }

    func contains(_ element: Bound) -> Bool

    var isEmpty: Bool { get }

    init(_ other: Range<Bound>)

    func overlaps(_ other: Range<Bound>) -> Bool
    func overlaps(_ other: ClosedRange<Bound>) -> Bool
}

extension RangeType {
    public func clamp(_ value: Bound) -> Bound {
        return min(max(value, lowerBound), upperBound)
    }
}

extension RangeType {
    public func overlap(_ other: Self) -> Self {
        fatalError()
    }
}

extension Range: RangeType {
}

extension CountableRange: RangeType {
}

extension ClosedRange: RangeType {
    public init(_ other: Range<Bound>) {
        lowerBound = other.lowerBound
        upperBound = other.upperBound
    }

}

extension CountableClosedRange: RangeType {
}
