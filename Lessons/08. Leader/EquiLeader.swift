import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var size = 0
    var leader = 0
    
    for n in A {
        if size == 0 {
            size += 1
            leader = n
        } else {
            size = size + (leader == n ? 1 : -1)
        }
    }
    
    guard size > 0 else { return 0 }
    
    var count = 0
    
    for n in A {
        if n == leader {
            count += 1
        }
    }
    
    guard count > (A.count / 2) else { return 0 }
    
    var result = 0
    var left = 0
    var right = count
    
    for (i, n) in A.dropLast(1).enumerated() {
        if n == leader {
            left += 1
            right += -1
        }
        
        if left > ((i + 1) / 2), right > ((A.count - i - 1) / 2) {
            result += 1
        }
    }
    
    return result
}
