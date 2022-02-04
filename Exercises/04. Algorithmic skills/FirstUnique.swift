import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var countDict: [Int: Int] = [:]

    for a in A {
        countDict[a] = (countDict[a] ?? 0) + 1
    }
    // print("countDict: \(countDict)")

    for a in A {
        if countDict[a] == 1 {
            return a
        }
    }

    return -1
}
