//
//  GratefulMomentsApp.swift
//  GratefulMoments
//
//  Created by Александра Савичева on 18.03.2026.
//

import SwiftUI

@main
struct GratefulMomentsApp: App {
    let dataContainer = DataContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataContainer)
        }
        .modelContainer(dataContainer.modelContainer)
    }
}
