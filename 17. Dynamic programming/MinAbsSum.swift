import Foundation
import Glibc

// O(N**2 * max(abs(A))) solution
//public func solution(_ A : inout [Int]) -> Int {
//    let n = A.count
//
//    guard n > 0 else { return 0 }
//    guard n > 1 else { return abs(A[0]) }
//
//    let absA = A.map { abs($0) }
//    let S = absA.reduce(0, +)
//
//    var dp = Array(repeating: 0, count: S + 1)
//    dp[0] = 1
//
//    for j in 0..<n {
//        for i in 0...S {
//            if dp[S - i] == 1, S - i + absA[j] <= S {
//                dp[S - i + absA[j]] = 1
//            }
//        }
//    }
//
//    var result = S
//
//    for i in 0..<(S / 2 + 1) {
//        if dp[i] == 1 {
//            result = min(result, S - 2 * i)
//        }
//    }
//
//    return result
//}

// O(N * max(abs(A))**2) solution
public func solution(_ A : inout [Int]) -> Int {
    let n = A.count
    
    guard n > 0 else { return 0 }
    guard n > 1 else { return abs(A[0]) }
    
    let absA = A.map { abs($0) }
    let S = absA.reduce(0, +)
    
    var M = 0
    for a in absA {
        M = max(M, a)
    }
    
    var count = Array(repeating: 0, count: M + 1)
    
    for a in absA {
        count[a] += 1
    }
    
    var dp = Array(repeating: -1, count: S + 1)
    dp[0] = 0
    
    for i in 1..<(M + 1) {
        guard count[i] > 0 else { continue }
        
        for j in 0..<S {
            if dp[j] >= 0 {
                dp[j] = count[i]
            } else if j >= i, dp[j - i] > 0 {
                dp[j] = dp[j - i] - 1
            }
        }
    }
    
    var result = S
    
    for i in 0..<(S / 2 + 1) {
        if dp[i] >= 0 {
            result = min(result, S - 2 * i)
        }
    }
    
    return result
}
