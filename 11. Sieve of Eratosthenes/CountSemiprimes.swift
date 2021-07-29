import Foundation
import Glibc

func sieve(_ n: Int) -> [Bool] {
    var s = Array(repeating: true, count: n + 1)
    s[0] = false
    s[1] = false
    
    var i = 2
    
    while i * i <= n {
        if s[i] {
            var k = i * i
            while k <= n {
                s[k] = false
                k += i
            }
        }
        
        i += 1
    }
    
    return s
}

func primes(_ n: Int) -> [Int] {
    let s = sieve(n)
    
    var result: [Int] = []
    for i in 0..<s.count {
        if s[i] {
            result.append(i)
        }
    }
    
    return result
}

func semiprimes(_ n: Int) -> [Int] {
    guard n > 2 else { return [] }
    
    let p = primes(n / 2)
    
    var result: Set<Int> = []
    
    for i in p {
        for j in p {
            guard i * j <= n else { continue }
            
            result.insert(i * j)
        }
    }
    
    return Array(result.sorted())
}

public func solution(_ N : Int, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    var s = Array(repeating: 0, count: N + 1)
    var lastIndex = 0
    var counter = 0
    for p in semiprimes(N) {
        for i in lastIndex..<p {
            s[i] = counter
        }
        
        counter += 1
        lastIndex = p
    }
    for i in lastIndex...N {
        s[i] = counter
    }
    
    var result: [Int] = []
    
    for i in 0..<P.count {
        let left = P[i]
        let right = Q[i]
        
        result.append(s[right] - s[left - 1])
    }
    
    return result
}
