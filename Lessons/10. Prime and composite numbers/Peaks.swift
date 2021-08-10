import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 2 else { return 0 }
    
    var peaks = Array(repeating: false, count: A.count)
    var peaksCount = 0
    
    for i in 1..<(A.count-1) {
        if A[i-1] < A[i], A[i] > A[i+1] {
            peaks[i] = true
            peaksCount += 1
        }
    }
    
    guard peaksCount > 0 else { return 0 }
    
    var result = peaksCount
    
    while result > 1 {
        guard (A.count % result) == 0 else {
            result -= 1
            continue
        }
        
        let groupSize = A.count / result
        
        var allGroupsHavePeaks = true
        
        for i in 0..<result {
            var groupHasPeak = false
            for j in 0..<groupSize {
                if peaks[i * groupSize + j] {
                    groupHasPeak = true
                    break
                }
            }
            
            if groupHasPeak == false {
                allGroupsHavePeaks = false
                break
            }
        }
        
        if allGroupsHavePeaks {
            return result
        } else {
            result -= 1
        }
    }
    
    return result
}
