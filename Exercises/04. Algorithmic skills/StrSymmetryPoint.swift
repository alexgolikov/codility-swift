import Foundation
import Glibc

public func solution(_ S : inout String) -> Int {
    let count = S.count
    
    guard count > 0 else { return -1 }
    guard count > 1 else { return 0 }
    guard count % 2 == 1 else { return -1 }

    var l = S.startIndex
    var r = S.index(before: S.endIndex)
    var result = 0

    while l != r {
        if S[l] != S[r] {
            return -1
        } else {
            l = S.index(after: l)
            r = S.index(before: r)
            result += 1
        }
    }

    return result
}
