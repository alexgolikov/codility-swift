import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var b: [Bool] = Array(repeating: false, count: (A.count + 1))
    
    for a in A {
        b[a-1] = true
    }
    
    for (index, element) in b.enumerated() {
        if element == false {
            return (index + 1)
        }
    }
    
    return 0
}
