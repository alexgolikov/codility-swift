import Foundation
import Glibc

public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    guard A.count > 1 else { return A.count }
    
    var end = B[0]
    var result = 1
    
    for i in 1..<A.count {
        if A[i] > end {
            result += 1
            end = B[i]
        }
        
    }
    
    return result
}
