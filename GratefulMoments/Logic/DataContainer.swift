//
//  DataContainer.swift
//  GratefulMoments
//
//  Created by Александра Савичева on 18.03.2026.
//

import SwiftData
import SwiftUI

@Observable
@MainActor
class DataContainer {
    let modelContainer: ModelContainer
    var badgeManager: BadgeManager
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    init(includeSampleMomemts: Bool = false) {
        let schema = Schema([
            Moment.self,
            Badge.self,
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: includeSampleMomemts)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            // Declare here because badgeManager is dependency of modelContainer
            badgeManager = BadgeManager(modelContainer: modelContainer)
            
            // It is possible put this logic in DataContainer,
            // but keeping it in BadgeManager reduces the responsibilities of DataContainer.
            try badgeManager.loadBadgesIfNeeded()
            
            if includeSampleMomemts {
                try loadSampleMoments()
            }
            
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
        
        func loadSampleMoments() throws {
            for momemt in Moment.sampleData {
                context.insert(momemt)
                try badgeManager.unlockBadges(newMoment: momemt)
            }
        }
    }
}

@MainActor
private let sampleContainer = DataContainer(includeSampleMomemts: true)

extension View {
    func sampleDataContainer() -> some View {
        self
            .environment(sampleContainer)
            .modelContainer(sampleContainer.modelContainer)
    }
}
