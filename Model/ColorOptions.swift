//
//  ColorOptions.swift
//  swiftodo
//
//  Created by TeU on 2022/6/6.
//

import SwiftUI

struct ColorOptions {
    static let all: [Color] = [
        .primary,
        .gray,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .cyan,
        .indigo,
        .purple,
    ]

    static let `default` = Color.primary

    static func random() -> Color {
        if let element = ColorOptions.all.randomElement() {
            return element
        }

        return `default`
    }
}
