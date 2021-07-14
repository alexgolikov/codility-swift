import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 0 else { return 0 }
    
    let sorted = A.sorted()
    
    var result = 1
    
    for i in 0..<(sorted.count - 1) {
        result += (sorted[i] != sorted[i+1]) ? 1 : 0
    }
    
    return result
}
