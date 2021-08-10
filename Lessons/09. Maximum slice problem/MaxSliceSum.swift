import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var max_ending = A[0]
    var max_slice = A[0]
    
    for i in 1..<A.count {        
        max_ending = max(A[i], max_ending + A[i])
        max_slice = max(max_slice, max_ending)
    }
    
    return max_slice
}
