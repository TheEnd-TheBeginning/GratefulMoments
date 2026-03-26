//
//  HexagonAccessoryView.swift
//  GratefulMoments
//
//  Created by Александра Савичева on 20.03.2026.
//

import SwiftUI

struct HexagonAccessoryView: View {
    var moment: Moment
    var hexagonLayout: HexagonLayout
    
    var body: some View {
        NavigationLink {
            if badges.count == 1 {
                BadgeDetailView(badge: badges.first!)
            } else {
                MomentDetailView(moment: moment)
            }
        } label: {
            badgeView
        }
    }
    
    private var badgeView: some View {
        Group {
            if badges.count > 1 {
                Text("+\(badges.count)")
                    .bold()
                    .minimumScaleFactor(0.3)
                    .frame(width: size * 0.5, height: size * 0.5)
                    .padding(8)
                    .background {
                        Image("Blank")
                            .resizable()
                            .frame(width: size, height: size)
                            .shadow(radius: 2)
                    }
            } else if let badge = badges.first {
                Image(badge.details.image)
                    .resizable()
                    .frame(width: size, height: size)
                    .shadow(radius: 2)
            }
        }
        .offset(y: yOffset)
    }
    
    private var yOffset: CGFloat {
        let radius = hexagonLayout.size / 2
        // 30 degrees points to the top right corner of a hexagon
        let yOffsetFromHexagonCenter = sin(Angle.degrees(30).radians) * radius
        return radius - yOffsetFromHexagonCenter - (size / 2)
    }
    
    private var badges: [Badge] {
        moment.badges
    }
    
    private var size: CGFloat {
        hexagonLayout.size / 5
    }
}

#Preview("Simple badge") {
    MomentHexagonView(moment: .sample, layout: .large)
        .sampleDataContainer()
}

#Preview("Multiple badges") {
    MomentHexagonView(moment: .imageSample, layout: .large)
        .dynamicTypeSize(.accessibility3)
        .sampleDataContainer()
}
