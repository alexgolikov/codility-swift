import Foundation
import Glibc

public func solution(_ S : inout String) -> Int {
    var result = -1
    
    for s in S.components(separatedBy: " ") {
        guard s.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil else { continue }
        
        let lettersCount = s.reduce(0, { CharacterSet(charactersIn: String($1)).isSubset(of: CharacterSet.letters) ? $0 + 1 : $0 } )
        guard lettersCount % 2 == 0 else { continue }
        
        let digitsCount = s.reduce(0, { CharacterSet(charactersIn: String($1)).isSubset(of: CharacterSet.decimalDigits) ? $0 + 1 : $0 } )
        guard digitsCount % 2 == 1 else { continue }
        
        result = max(result, s.length)
    }
    
    return result
}
