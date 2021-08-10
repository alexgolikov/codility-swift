import Foundation
import Glibc

public func solution(_ A : inout [Int], _ B : inout [Int]) -> [Int] {
    var fs = Array(repeating: 0, count: A.count + 2)
    fs[1] = 1
    fs[2] = 2
    
    if A.count > 2 {
        for i in 3...A.count {
            fs[i] = (fs[i - 2] + fs[i - 1]) % (1 << 30)
        }
    }
    
    var result = Array(repeating: 0, count: A.count)
    
    for i in 0..<A.count {
        result[i] = fs[A[i]] % (1 << B[i])
    }
    
    return result
}
