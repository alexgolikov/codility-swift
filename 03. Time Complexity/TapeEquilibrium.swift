import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    let sum = A.reduce(0, +)
    
    var result = Int.max
    
    var left = 0
    
    for a in A.dropLast(1) {
        left += a
        let right = sum - left
        
        result = min(result, abs(left - right))
    }
    
    return result
}
