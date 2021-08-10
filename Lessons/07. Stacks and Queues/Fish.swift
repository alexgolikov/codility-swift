import Foundation
import Glibc

public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    struct Fish {
        let size: Int
        let direction: Int
    }
    
    var stack: [Fish] = []
    stack.reserveCapacity(A.count)
    
    for i in 0..<A.count {
        let currentFish = Fish(size: A[i], direction: B[i])
        
        while stack.count > 0 {
            let prevFish = stack[stack.count - 1]
            
            if prevFish.direction == 1, currentFish.direction == 0 {
                if prevFish.size < currentFish.size {
                    stack.remove(at: stack.count - 1)
                } else {
                    break
                }
            } else {
                stack.append(currentFish)
                break
            }
        }
        
        if stack.count == 0 {
            stack.append(currentFish)
        }
    }
    
    return stack.count
}
