import Foundation
import Glibc

public func solution(_ N : Int) -> Int {
    var result = 0
    var c: Int = N
    var r: Int = 0
    var collectingMode = false
    
    var tempRes = 0
    while c > 0 {
        r = c % 2
        c = c / 2
        
        if collectingMode {
            if r > 0 {
                result = max(result, tempRes)
                tempRes = 0
            } else {
                tempRes += 1
            }
        } else {
            if r > 0 {
                collectingMode = true
            }
        }
    }
    
    return result
}
