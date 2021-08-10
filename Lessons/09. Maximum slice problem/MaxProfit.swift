import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 0 else { return 0 }
    
    var max_ending = 0
    var max_slice = 0
    
    for i in 1..<A.count {
        max_ending = max(0, max_ending + (A[i] - A[i-1]))
        max_slice = max(max_slice, max_ending)
    }
    
    return max_slice
}
