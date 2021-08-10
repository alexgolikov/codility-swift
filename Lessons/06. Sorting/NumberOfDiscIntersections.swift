import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 1 else { return 0 }
    
    struct Point {
        enum Position {
            case left
            case right
        }
        let coordinate: Int
        let position: Position
    }
    
    let sortedPoints = A.enumerated().flatMap { (index, element) in
        return [Point(coordinate: index - element, position: .left),
                Point(coordinate: index + element, position: .right)]
        }.sorted {
            if $0.coordinate == $1.coordinate {
                return $0.position == .left
            } else {
                return $0.coordinate < $1.coordinate
            }
    }
    
    var result = 0
    var openedSegmentCount = 0
    
    for point in sortedPoints {
        switch point.position {
        case .left:
            openedSegmentCount += 1
        case .right:
            openedSegmentCount -= 1
            result += openedSegmentCount
        }
    }
    
    return result > 10_000_000 ? -1 : result
}
