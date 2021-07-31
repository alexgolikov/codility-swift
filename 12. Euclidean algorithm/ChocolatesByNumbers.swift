import Foundation
import Glibc

func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 {
        return b
    } else {
        return gcd(b, a % b)
    }
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return (a * b) / gcd(a, b)
}

public func solution(_ N : Int, _ M : Int) -> Int {
    return lcm(N, M) / M
}
