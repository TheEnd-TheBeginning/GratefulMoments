//
//  Hexagon.swift
//  GratefulMoments
//
//  Created by Александра Савичева on 19.03.2026.
//

import SwiftUI

struct Hexagon<Content: View>: View {
    private let borderWidth: CGFloat = 2.0
    var borderColor: Color = .ember
    var layout: HexagonLayout = .standart
    var moment: Moment?
    @ViewBuilder var content: () -> Content
    var body: some View {
        ZStack {
            if let background = moment?.image {
                Image(uiImage: background)
                    .resizable()
                    .scaledToFill()
            }
            content()
                .frame(width: layout.size, height: layout.size)
        }
        .mask {
            Image(systemName: "hexagon.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: layout.size - borderWidth, height: layout.size - borderWidth)
                .fontWeight(.ultraLight)
        }
        .background {
            Image(systemName: "hexagon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: layout.size, height: layout.size)
                .foregroundStyle(borderColor)
                .fontWeight(.ultraLight)
        }
        .frame(width: layout.size, height: layout.size)
        .overlay(alignment: .topTrailing) {
            if let moment {
                HexagonAccessoryView(moment: moment, hexagonLayout: layout)
            }
        }
    }
}

#Preview {
    Hexagon(moment: Moment.imageSample) {
        Text(Moment.imageSample.title)
            .foregroundStyle(.white)
    }
}
