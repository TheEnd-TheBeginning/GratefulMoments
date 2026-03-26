//
//  AchievmentsView.swift
//  GratefulMoments
//
//  Created by Александра Савичева on 19.03.2026.
//

import SwiftUI
import SwiftData

struct AchievmentsView: View {
    @Query(filter: #Predicate<Badge> { $0.timestamp != nil })
    private var unlockedBadges: [Badge]
    
    @Query(filter: #Predicate<Badge> { $0.timestamp == nil })
    private var lockedBadges: [Badge]
    
    @Query(sort: \Moment.timestamp)
    private var moments: [Moment]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                contentStack
            }
            .navigationTitle("Achievments")
        }
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
    }
    
    private var contentStack: some View {
        VStack(alignment: .leading) {
            StreakView(numberOfDates: StreakCalculator().calculateStreak(for: moments))
                .frame(maxWidth: .infinity)
            
            if !unlockedBadges.isEmpty {
                header("Your badges")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(sortedUnlockedBadges) { badge in
                            UnlockedBadgeView(badge: badge)
                        }
                    }
                }
                .scrollClipDisabled()
                .scrollIndicators(.hidden)
            }
            
            if !lockedBadges.isEmpty {
                header("Locked badges")
                ForEach(sortedLockedBadges) { badge in
                    LockedBadgeView(badge: badge)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
    
    private func header(_ text: String) -> some View {
        Text(text)
            .font(.subheadline.bold())
            .padding()
    }
    
    /// - precondition: `unlockedBadges` must have a timestamp
    private var sortedUnlockedBadges: [Badge] {
        unlockedBadges.sorted {
            ($0.timestamp!, $0.details.title) < ($1.timestamp!, $1.details.title)
        }
    }
    
    private var sortedLockedBadges: [Badge] {
        lockedBadges.sorted {
            $0.details.rawValue < $1.details.rawValue
        }
    }
}

#Preview {
    AchievmentsView()
        .sampleDataContainer()
}
