import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var maxSliceLeft = Array(repeating: 0, count: A.count)
    var maxSliceRight = Array(repeating: 0, count: A.count)
    
    var maxEnding = 0
    for i in 1..<(A.count-1) {
        maxEnding = max(0, maxEnding + A[i])
        maxSliceLeft[i] = maxEnding
    }
    
    maxEnding = 0
    for i in stride(from: (A.count-2), to: 0, by: -1) {
        maxEnding = max(0, maxEnding + A[i])
        maxSliceRight[i] = maxEnding
    }
    
    var result = 0
    
    for i in 1..<(A.count-1) {
        result = max(result, maxSliceLeft[i-1] + maxSliceRight[i+1])
    }
    
    return result
}
