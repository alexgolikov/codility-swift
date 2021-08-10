import Foundation
import Glibc

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    guard A.count > 0 else { return A }
    
    let realOffset = K % A.count
    guard realOffset != 0 else { return A }
    
    var result = [Int]()
    
    for i in 0..<A.count {
        let indexFrom: Int
        if i < realOffset {
            indexFrom = A.count + i - realOffset
        } else {
            indexFrom = i - realOffset
        }
        
        result.append(A[indexFrom])
    }
    
    return result
}
