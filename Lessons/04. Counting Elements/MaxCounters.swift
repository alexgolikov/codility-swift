import Foundation
import Glibc

public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    var maxValue = 0
    var maxApplied = true
    var result: [Int] = Array(repeating: 0, count: N)
    
    for a in A {
        if a <= N {
            result[a - 1] = result[a - 1] + 1
            maxValue = max(maxValue, result[a - 1])
            maxApplied = false
        } else {
            if !maxApplied {
                result = Array(repeating: maxValue, count: N)
                maxApplied = true
            }
        }
    }
    
    return result
}
