import Foundation
import Glibc

public func solution(_ H : inout [Int]) -> Int {
    var stack: [Int] = []
    
    var result = 0
    var lastHeight = 0
    
    for h in H {
        if h < lastHeight {
            while stack.count > 0 {
                if h < stack[stack.count - 1] {
                    stack.remove(at: stack.count - 1)
                    result += 1
                } else if h == stack[stack.count - 1] {
                    stack.remove(at: stack.count - 1)
                    break
                } else {
                    break
                }
            }
            
            stack.append(h)
        } else if h > lastHeight {
            stack.append(h)
        }
        
        lastHeight = h        
    }
    
    return result + stack.count
}
