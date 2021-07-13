import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var storage: Set<Int> = []
    for a in A {
        if storage.contains(a) {
            storage.remove(a)
        } else {
            storage.insert(a)
        }
    }
    
    return storage.first!
}
