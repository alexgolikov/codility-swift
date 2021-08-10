import Foundation
import Glibc

public func solution(_ K : Int, _ A : inout [Int]) -> Int {
    var sum = 0
    var result = 0
    
    for a in A {
        if sum + a < K {
            sum += a
        } else {
            sum = 0
            result += 1
        }
    }
    
    return result
}
