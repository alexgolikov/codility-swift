import Foundation
import Glibc
import extratypes // this library contains declarations of types from the task

public func solution(_ T : Tree?) -> Int {
    guard let T else { return -1 }
    
    return maxDepth(for: T, currentDepth: 0)
}

private func maxDepth(for tree: Tree, currentDepth: Int) -> Int {
    let leftDepth: Int
    if let leftTree = tree.l {
        leftDepth = maxDepth(for: leftTree, currentDepth: currentDepth + 1)
    } else {
        leftDepth = currentDepth
    }
    
    let rightDepth: Int
    if let rightTree = tree.r {
        rightDepth = maxDepth(for: rightTree, currentDepth: currentDepth + 1)
    } else {
        rightDepth = currentDepth
    }
    
    return max(leftDepth, rightDepth)
}
