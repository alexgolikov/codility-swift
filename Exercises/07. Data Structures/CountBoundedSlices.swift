import Foundation
import Glibc

public func solution(_ K : Int, _ A : inout [Int]) -> Int {
    let N = A.count

    var maxQ = Array(repeating: 0, count: N + 1)
    var posmaxQ = Array(repeating: 0, count: N + 1)
    var minQ = Array(repeating: 0, count: N + 1)
    var posminQ = Array(repeating: 0, count: N + 1)
    var firstMax = 0
    var lastMax = -1
    var firstMin = 0
    var lastMin = -1
    var j = 0
    var result = 0

    for i in 0..<N {
        while j < N {
            while lastMax >= firstMax
                    && maxQ[lastMax] <= A[j] {
                lastMax -= 1
            }

            lastMax += 1
            maxQ[lastMax] = A[j]
            posmaxQ[lastMax] = j

            while lastMin >= firstMin
                    && minQ[lastMin] >= A[j] {
                lastMin -= 1
            }

            lastMin += 1
            minQ[lastMin] = A[j]
            posminQ[lastMin] = j

            if maxQ[firstMax] - minQ[firstMin] <= K {
                j += 1
            } else {
                break
            }
        }

        result += (j - i)

        if result >= 1_000_000_000 {
            return 1_000_000_000
        }

        if posminQ[firstMin] == i {
            firstMin += 1
        }

        if posmaxQ[firstMax] == i {
            firstMax += 1
        }
    }

    return result
}
