import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var result = 1
    var index = 0

    while true {
        if A[index] == -1 {
            return result
        } else {
            index = A[index]
            result += 1
        }
    }
}
