
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
    init(_ bound: Bound) {
        self.init(uncheckedBounds: (bound, bound))
    }

    init<R: RangeType>(_ other: R) where R.Bound == Bound {
        self.init(uncheckedBounds: (other.lowerBound, other.upperBound))
    }

}

extension RangeType {
    public func intersect(_ other: Self) -> Self {
        guard upperBound > other.lowerBound else {
            return Self(upperBound)
        }

        guard other.upperBound > lowerBound else {
            return Self(lowerBound)
        }
        let s = max(lowerBound, other.lowerBound)
        let e = min(upperBound, other.upperBound)
        return Self(uncheckedBounds: (s,e))
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
