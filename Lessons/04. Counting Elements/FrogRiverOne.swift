import Foundation
import Glibc

public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    var storage: Set<Int> = []
    
    for (index, a) in A.enumerated() {
        storage.insert(a)
        
        if storage.count == X {
            return index
        }
    }
    
    return -1
}
