//
//  Badge.swift
//  GratefulMoments
//
//  Created by Александра Савичева on 19.03.2026.
//

import Foundation
import SwiftData


/// Use `timestamp` to determine if a badge is unlocked.
/// A `Moment` may be deleted but the timestamp stays.
/// Once awarded, badges aren't relock.
@Model
class Badge {
    var details: BadgeDetails
    var moment: Moment?
    var timestamp: Date?
    
    init(details: BadgeDetails) {
        self.details = details
    }
}

extension Badge {
    static var sample: Badge {
        let badge = Badge(details: .firstEntry)
        badge.timestamp = .now
        return badge
    }
    
    static var newBadgeSample: Badge {
        let badge = Badge(details: .cleverFourty)
        badge.timestamp = .now
        return badge
    }
}
