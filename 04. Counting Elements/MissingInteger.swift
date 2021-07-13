import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    let sortedA = A.sorted()
    var result: Int = 1
    
    for a in sortedA {
        if a <= 0 {
            continue
        }
        
        if a == result {
            result = a + 1
        } else if (a - result) >= 1 {
            break
        }
    }
    
    return result
}
