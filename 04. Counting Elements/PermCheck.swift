import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    for (index, element) in A.sorted().enumerated() {
        if index + 1 != element {
            return 0
        }
    }
    
    return 1
}
