import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 1 else { return 1 }
        
    var result = A.count
    var back = 0
    
    var firstPositive = A.count
    
    for i in 0..<A.count {
        if A[i] > 0 {
            firstPositive = i
            break
        }
    }
        
    var A2: [Int] = []
    
    if firstPositive == A.count || firstPositive == 0 {
        A2 = A
    } else {
        var p = firstPositive
        var n = firstPositive - 1
        var m: [Int] = []
        
        while p < A.count || n > -1 {
            if p == A.count {
                m.append(abs(A[n]))
                n -= 1
                continue
            }
            if n == -1 {
                m.append(A[p])
                p += 1
                continue
            }
            
            if A[p] < abs(A[n]) {
                m.append(A[p])
                p += 1
            } else {
                m.append(abs(A[n]))
                n -= 1
            }
        }
        
        A2 = m
    }
        
    while back < (A2.count - 1) {
        var front = back + 1
        
        while front < A2.count, A2[back] == A2[front] {
            front += 1
        }
        
        let equalCount = front - back - 1
        
        result -= equalCount
        back += equalCount + 1
    }
    
    return result
}
