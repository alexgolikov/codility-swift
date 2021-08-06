import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 2 else { return 0 }
    
    let A2 = A.sorted()
    
    var result = 0
    
    for x in 0..<A2.count {
        var z = x + 2
        
        for y in (x + 1)..<A2.count {
            while z < A2.count, A2[x] + A2[y] > A2[z] {
                z += 1
            }
            
            result += z - y - 1
        }
    }
    
    return result
}
