import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 2 else { return 0 }
    
    var result: Int = 0
    var minHeight: Int = A[0]
    var maxHeight: Int = A[0]
    
    for i in 1..<A.count {
        if A[i] < A[i-1] {
            if A[i] < minHeight {
                minHeight = A[i]
            }
        }
        
        if A[i] > A[i-1] {
            if A[i] > maxHeight {
                if(result < maxHeight - minHeight) {
                    result = maxHeight - minHeight;
                }
                maxHeight = A[i]
                minHeight = A[i]
            } else {
                if result < (A[i] - minHeight) {
                    result = A[i] - minHeight
                }
            }
        }
        
        // print("for i: \(i)")
        // print("minHeight: \(minHeight)")
        // print("maxHeight: \(maxHeight)")
        // print("result: \(result)")
        // print("")
    }
    
    return result
}
