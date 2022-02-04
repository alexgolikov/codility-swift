import Foundation
import Glibc

public func solution(_ E : inout String, _ L : inout String) -> Int {
    let startParts = E.split(separator: ":")
    let startHours = Int(startParts.first ?? "0") ?? 0
    let startMinutes = Int(startParts.last ?? "0") ?? 0

    let endParts = L.split(separator: ":")
    let endHours = Int(endParts.first ?? "0") ?? 0
    let endMinutes = Int(endParts.last ?? "0") ?? 0

    var hours = endHours - startHours
    var minutes = endMinutes - startMinutes
    if minutes < 0 {
        hours -= 1
        minutes += 60
    }

    // print("hours: \(hours), minutes: \(minutes)")

    let entranceFee = 2
    let firtsHourFee = (hours > 0 || minutes > 0) ? 3 : 0
    let restHoursFee = hours >= 1 ? ((hours - 1) * 4 + ((minutes > 0) ? 4 : 0)) : 0

    // print("entranceFee: \(entranceFee), firtsHourFee: \(firtsHourFee), restHoursFee: \(restHoursFee)")

    return entranceFee + firtsHourFee + restHoursFee
}
