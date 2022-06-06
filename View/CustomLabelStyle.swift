//
//  CustomLabelStyle.swift
//  swiftodo
//
//  Created by TeU on 2022/6/6.
//

import SwiftUI

struct CustomLabelStyle: LabelStyle {
    @ScaledMetric private var iconWidth: Double = 40

    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 0) {
            configuration.icon
                .imageScale(.large)
                .frame(width: iconWidth)
            configuration.title
        }
    }
}
