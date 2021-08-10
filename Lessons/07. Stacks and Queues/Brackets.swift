import Foundation
import Glibc

public func solution(_ S : inout String) -> Int {
    var stack: Array<Character> = []
    
    let checkAndPop: (Character) -> Bool = { str in
        guard stack.count > 0 else { return false }
        
        if stack[stack.count - 1] == str {
            stack.remove(at: stack.count - 1)
            return true
        } else {
            return false
        }
    }
    
    for c in S {
        switch c {
        case "(", "{", "[":
            stack.append(c)
        case ")":
            guard checkAndPop("(") else { return 0 }
        case "}":
            guard checkAndPop("{") else { return 0 }
        case "]":
            guard checkAndPop("[") else { return 0 }
        default:
            break
        }
    }
    
    return stack.count == 0 ? 1 : 0
}
