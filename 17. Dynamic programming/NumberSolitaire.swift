import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    let n = A.count
    
    guard n > 2 else { return A[0] + A[1] }
    
    var dp = [A[0], A[0] + A[1]] + Array(repeating: Int.min, count: n - 2)
    
    for j in 2..<n {
        var m = Int.min
        
        for i in 1...6 {
            let k = j - i
            if k >= 0, k < n {
                m = max(m, dp[k] + A[j])
            }
        }
        
        dp[j] = m
    }
    
    return dp[n-1]
}
