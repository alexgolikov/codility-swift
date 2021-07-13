import Foundation
import Glibc

public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    let N = S.count
    
    var A = Array(repeating: N, count: N+1)
    var C = Array(repeating: N, count: N+1)
    var G = Array(repeating: N, count: N+1)
    var T = Array(repeating: N, count: N+1)
    
    for (p, s) in S.enumerated() {
        switch s {
        case "A":
            A[p+1] = p
            C[p+1] = C[p]
            G[p+1] = G[p]
            T[p+1] = T[p]
        case "C":
            A[p+1] = A[p]
            C[p+1] = p
            G[p+1] = G[p]
            T[p+1] = T[p]
        case "G":
            A[p+1] = A[p]
            C[p+1] = C[p]
            G[p+1] = p
            T[p+1] = T[p]
        case "T":
            A[p+1] = A[p]
            C[p+1] = C[p]
            G[p+1] = G[p]
            T[p+1] = p
        default:
            break
        }
    }
        
    var result: [Int] = []
    
    let check: (Int, Int, Int) -> Bool = { element, start, end in
        return (element <= end) && (element >= start)
    }
    
    for (index, _) in P.enumerated() {
        let start = P[index]
        let end = Q[index]
        
        if check(A[end+1], start, end) {
            result.append(1)
        } else if check(C[end+1], start, end) {
            result.append(2)
        } else if check(G[end+1], start, end) {
            result.append(3)
        } else if check(T[end+1], start, end) {
            result.append(4)
        }
    }
    
    return result
}
