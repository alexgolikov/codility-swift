import Foundation
import Glibc

public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    let d = (Y - X) / D
    let r = ((Y - X) % D) > 0 ? 1 : 0
    
    return d + r
}
