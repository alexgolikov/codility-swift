import Foundation
import Glibc

func divisors(_ x: Int) -> [Int] {
    var result: [Int] = []
    
    var i = 1
    while i * i <= x {
        if x % i == 0 {
            if x / i == i {
                result.append(i)
            } else {
                result.append(x / i)
                result.append(i)
            }
        }
        
        i += 1
    }
    
    return result
}

public func solution(_ A : inout [Int]) -> [Int] {
    var maxA = 0
    for a in A {
        if a > maxA {
            maxA = a
        }
    }
    
    var storage = Array(repeating: 0, count: maxA + 1)
    for a in A {
        storage[a] += 1
    }
    
    var result: [Int] = []
    var divisorsMap: [Int: [Int]] = [:]
    
    for a in A {
        let divs: [Int]
        if let ds = divisorsMap[a] {
            divs = ds
        } else {
            divs = divisors(a)
            divisorsMap[a] = divs
        }
        
        var res = A.count
        for d in divs {
            res -= storage[d]
        }
        
        result.append(res)
    }
    
    return result
}
