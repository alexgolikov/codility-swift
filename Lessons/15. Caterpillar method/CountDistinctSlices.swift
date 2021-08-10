import Foundation
import Glibc

public func solution(_ M : Int, _ A : inout [Int]) -> Int {
    var front = 0
    var result = 0
    var stor: Set<Int> = []

    for back in 0..<A.count {
        while front < A.count, !stor.contains(A[front]) {
            stor.insert(A[front])

            front += 1
            result += 1
        }

        result += front - back - 1
        
        guard result <= 1_000_000_000 else { return 1_000_000_000 }

        stor.remove(A[back])
    }

    return result
}
