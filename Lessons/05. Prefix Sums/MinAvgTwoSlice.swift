import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var minAvr: Double = Double(A[0] + A[1]) / 2
    var result = 0
    
    for first in 0..<(A.count - 2) {
        let avr2: Double = Double(A[first] + A[first + 1]) / 2.0
        
        if avr2 < minAvr {
            result = first
            minAvr = avr2
        }
        
        let avr3: Double = Double(A[first] + A[first + 1] + A[first + 2]) / 3.0
        
        if avr3 < minAvr {
            result = first
            minAvr = avr3
        }
    }
    
    let avr2: Double = Double(A[A.count - 2] + A[A.count - 1]) / 2.0
    
    if avr2 < minAvr {
        result = A.count - 2
        minAvr = avr2
    }

    return result
}
