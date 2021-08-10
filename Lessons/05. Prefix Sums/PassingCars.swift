import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var prefixSum = Array(repeating: 0, count: A.count + 1)
    
    for i in 1..<(A.count + 1) {
        prefixSum[i] = prefixSum[i - 1] + A[i - 1]
    }
    
    var result = 0
    
    for (i, a) in A.enumerated() {
        if a == 1 { continue }
        
        result += prefixSum[A.count] - prefixSum[i]
    }
    
    return result > 1_000_000_000 ? -1 : result
}
