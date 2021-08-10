import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    let sorted = A.sorted()
    let N = sorted.count
    
    return max(sorted[N - 3] * sorted[N - 2] * sorted[N - 1],
               sorted[0] * sorted[1] * sorted[N - 1])
}
