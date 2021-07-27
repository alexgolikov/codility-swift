import Foundation
import Glibc

public func solution(_ N : Int) -> Int {
    var result = 0
    var i = 1

    while i * i < N {
        result += (N % i == 0) ? 2 : 0
        i += 1
    }

    result += (i*i == N) ? 1 : 0

    return result
}
