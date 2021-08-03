import Foundation
import Glibc

func check(_ A: [Int], _ B: [Int], _ C: [Int], _ s: Int) -> Int {
    var result = 0
    
    var nails = Array(repeating: 0, count: 2 * C.count + 1)
    for c in 0..<s {
        nails[C[c]] = 1
    }
    
    var prefixSum = Array(repeating: 0, count: nails.count + 1)
    
    for i in 1..<(nails.count + 1) {
        prefixSum[i] = prefixSum[i - 1] + nails[i - 1]
    }
    
    for i in 0..<A.count {
        if prefixSum[B[i] + 1] - prefixSum[A[i]] > 0 {
            result += 1
        }
    }
    
    return result
}

public func solution(_ A : inout [Int], _ B : inout [Int], _ C : inout [Int]) -> Int {
    var begin = 1
    var end = C.count
    
    var result = -1
    
    while begin <= end {
        let mid = (begin + end) / 2
        
        if check(A, B, C, mid) >= A.count {
            end = mid - 1
            result = mid
        } else {
            begin = mid + 1
        }
    }
    
    return result
}
