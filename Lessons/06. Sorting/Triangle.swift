import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 2 else { return 0 }
    
    let sorted = A.sorted()
    
    for i in 0..<(sorted.count - 2) {
        if sorted[i] + sorted[i + 1] > sorted[i + 2] {
            return 1
        }
    }
    
    return 0
}
