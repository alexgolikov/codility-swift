import Foundation
import Glibc

public func solution(_ N : Int) -> Int {
    var i = Int(sqrt(Double(N)))
    
    while i >= 1 {
        if (N % i == 0) {
            return 2 * (i + N / i )
        }

        i -= 1
    }

    return 0
}
