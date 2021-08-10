import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    let A2 = A.sorted()
    
    var firstNonNegative = 0
    if A2[0] <= 0, A2[A2.count - 1] <= 0 {
        return abs(2 * A2[A2.count - 1])
    } else if A2[0] >= 0, A2[A2.count - 1] >= 0 {
        return abs(2 * A2[0])
    } else {
        for i in 0..<A2.count {
            if A2[i] >= 0 {
                firstNonNegative = i
                break
            }
        }
    }
    
    var right = firstNonNegative
    var left = firstNonNegative - 1
    
    var result = abs(A2[left] + A2[right])
    if result == 0 { return 0 }
    
    while right < A2.count, left >= 0 {
        let rightCandidate = right == A2.count - 1 ? result : abs(A2[left] + A2[right + 1])
        let leftCandidate = left == 0 ? result : abs(A2[left - 1] + A2[right])
        
        if rightCandidate <= leftCandidate {
            right += 1
            result = min(result, rightCandidate)
        }
        else {
            left -= 1
            result = min(result, leftCandidate)
        }
    }
    
    return result
}
