import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    guard A.count > 1 else { return 0 }

    var sorted = A.sorted()
    var result = 0

    for i in 0..<(A.count-1) {
        guard var index = binarySearch(in: sorted, target:A[i]) else { continue }

        while index > 0,
        sorted[index - 1] == sorted[index] {
            index -= 1
        }

        result += index

        if result > 1_000_000_000 {
            return -1
        }

        sorted.remove(at: index)
    }

    return result
}

func binarySearch(in array: [Int], target: Int) -> Int? {
    var left = 0
    var right = array.count - 1

    while left <= right {
        let mid = left + (right - left) / 2
        if array[mid] == target {
            return mid
        } else if array[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return nil
}

// public func solution(_ A : inout [Int]) -> Int {
//     var result = 0
//
//     for i in 0..<(A.count-1) {
//         for j in (i+1)..<A.count {
//             if i < j
//             && A[i] > A[j] {
//                 result += 1
//
//                 if result > 1_000_000_000 {
//                     return -1
//                 }
//             }
//         }
//     }
//
//     return result
// }
