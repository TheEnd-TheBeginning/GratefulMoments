//
//  GratefulMomentsTest.swift
//  GratefulMomentsTest
//
//  Created by Александра Савичева on 20.03.2026.
//

import Testing
@testable import GratefulMoments

struct GratefulMomentsTest {

    @Test("Calculate streak", arguments: [
        (daysAgoArray: [0], targetStreak: 1),
        ([0, 0], 1),
        ([0, 1], 2),
        ([0, 1, 3], 2),
    ])
    func daysAgoTest(daysAgoArray: [Int], targetStreak: Int) async throws {
        var streak = 0
        for daysAgo in daysAgoArray {
            guard daysAgo <= streak else { break }
            if daysAgo == streak {
                streak += 1
            }
        }
        #expect(streak == targetStreak)
    }

}
