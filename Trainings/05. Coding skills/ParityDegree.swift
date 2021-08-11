import Foundation
import Glibc

public func solution(_ N : Int) -> Int {
    var i = 1
    var result = 0

    while i * i <= N {
        if N % i == 0 {
            let k1 = Int(log2(Double(i)))

            if Int(pow(2.0, Double(k1))) == i {
                result = max(result, k1)
            }

            let k2 = Int(log2(Double(N / i)))

            if Int(pow(2.0, Double(k2))) == N / i {
                result = max(result, k2)
            }
        }

        i += 1
    }

    return result
}
