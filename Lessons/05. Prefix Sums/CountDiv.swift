import Foundation
import Glibc

public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int {
    return B / K - A / K + (A % K == 0 ? 1 : 0)
}
