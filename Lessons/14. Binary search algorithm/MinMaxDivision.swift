import Foundation
import Glibc

func check(_ A: [Int], _ s: Int) -> Int {
    var result = 1
    var block = 0
    
    for i in A {
        if i > s {
            return Int.max
        }
        
        if block + i > s {
            result += 1
            block = i
        } else {
            block += i
        }
    }
    
    return result
}

public func solution(_ K : Int, _ M : Int, _ A : inout [Int]) -> Int {
    var begin = 0
    var end = M * A.count
    
    var result = -1
    
    while begin <= end {
        let mid = (begin + end) / 2
        
        if check(A, mid) <= K {
            end = mid - 1
            result = mid
        } else {
            begin = mid + 1
        }
    }
    
    return result
}
