//
//  ContentView.swift
//  GratefulMoments
//
//  Created by Александра Савичева on 18.03.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Moments", image: "MomentsTab") {
                MomentsView()
            }
            
            Tab("Achievments", systemImage: "medal.fill") {
                AchievmentsView()
            }
        }
    }
}

#Preview {
    ContentView()
        .sampleDataContainer()
}

#Preview("Dark Mode") {
    ContentView()
        .sampleDataContainer()
        .preferredColorScheme(.dark)
}
