import Foundation
import Glibc

public func solution(_ S : inout String) -> Int {
    var stack: Array<Character> = []
    
    for c in S {
        switch c {
        case "(":
            stack.append(c)
        case ")":
            guard stack.count > 0 else { return 0 }
            
            if stack[stack.count - 1] == "(" {
                stack.remove(at: stack.count - 1)
            } else {
                return 0
            }
        default:
            break
        }
    }
    
    return stack.count == 0 ? 1 : 0
}
