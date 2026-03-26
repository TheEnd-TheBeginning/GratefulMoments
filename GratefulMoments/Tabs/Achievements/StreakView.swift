//
//  StreakView.swift
//  GratefulMoments
//
//  Created by Александра Савичева on 20.03.2026.
//

import SwiftUI

struct StreakView: View {
    var numberOfDates: Int
    
    var body: some View {
        Hexagon(borderColor: .secondary) {
            VStack {
                Text("Streak \(Image(systemName: "flame.fill"))")
                    .foregroundStyle(.ember)
                
                Text(attributedText)
                    .multilineTextAlignment(.center)
            }
            .font(.callout)
        }
    }
    
    var attributedText: AttributedString {
        var attributedString = AttributedString(
            localized: "^[\(numberOfDates) \nDays](inflect: true)"
        )
        
        if let range = attributedString.range(of: "\(numberOfDates)") {
            attributedString[range].font = .system(size: 70)
        }
        
        return attributedString
    }
}

#Preview {
    StreakView(numberOfDates: 0)
    StreakView(numberOfDates: 1)
    StreakView(numberOfDates: 23)
}
