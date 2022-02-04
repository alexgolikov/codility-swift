import Foundation
import Glibc

public func solution(_ K : Int, _ C : inout [Int], _ D : inout [Int]) -> Int {
    var cleanDict: [Int: Int] = [:]
    var dirtyDict: [Int: Int] = [:]

    for c in C {
        cleanDict[c] = (cleanDict[c] ?? 0) + 1
    }

    for d in D {
        dirtyDict[d] = (dirtyDict[d] ?? 0) + 1
    }

    // print("cleanDict: \(cleanDict)")
    // print("dirtyDict: \(dirtyDict)")

    var cleanWithCleanPair = 0
    var dirtyWithCleanPair = 0
    var dirtyWithDirtyPair = 0

    for (color, count) in cleanDict {
        cleanWithCleanPair += count / 2
        cleanDict[color] = count % 2
    }
    // print("cleanDict changed: \(cleanDict)")

    for (color, count) in dirtyDict {
        if let cleanCount = cleanDict[color], cleanCount > 0 {
            dirtyWithCleanPair += 1
            dirtyDict[color] = count - 1
        }
    }
    // print("dirtyDict changed: \(dirtyDict)")

    for (_, count) in dirtyDict {
        dirtyWithDirtyPair += count / 2
    }

    // print("cleanWithCleanPair: \(cleanWithCleanPair)")
    // print("dirtyWithCleanPair: \(dirtyWithCleanPair)")
    // print("dirtyWithDirtyPair: \(dirtyWithDirtyPair)")

    let dirtyWithCleanPairToWash = min(K, dirtyWithCleanPair)
    let dirtyWithDirtyPairToWash = min(K - dirtyWithCleanPairToWash, 2 * dirtyWithDirtyPair) / 2

    // print("dirtyWithCleanPairToWash: \(dirtyWithCleanPairToWash)")
    // print("dirtyWithDirtyPairToWash: \(dirtyWithDirtyPairToWash)")

    return cleanWithCleanPair + dirtyWithCleanPairToWash + dirtyWithDirtyPairToWash
}
