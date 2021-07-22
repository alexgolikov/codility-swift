import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 0 else { return -1 }
    
    var size = 0
    var candidate = 0
    
    for n in A {
        if size == 0 {
            size += 1
            candidate = n
        } else {
            size = size + (candidate == n ? 1 : -1)
        }
    }
    
    guard size > 0 else { return -1 }
    
    var count = 0
    var leaderIndex = 0
    
    for (i, n) in A.enumerated() {
        if n == candidate {
            count += 1
            leaderIndex = i
        }
    }
    
    return count > (A.count / 2) ? leaderIndex : -1
}
