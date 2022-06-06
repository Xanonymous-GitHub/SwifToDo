//
//  SymbolPicker.swift
//  swiftodo
//
//  Created by TeU on 2022/6/6.
//

import SwiftUI

struct SymbolPicker: View {
    @Binding var event: Event
    @State private var selectedColor = ColorOptions.default
    @Environment(\.dismiss) private var dismiss

    let columns = Array(repeating: GridItem(.flexible()), count: 6)

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }
                .padding()
            }

            HStack {
                Image(systemName: event.symbol)
                    .font(.title)
                    .imageScale(.large)
                    .foregroundColor(selectedColor)
            }
            .padding()

            HStack {
                ForEach(ColorOptions.all, id: \.self) { color in
                    Button {
                        event.color = color
                        selectedColor = color
                    } label: {
                        Circle()
                            .foregroundColor(color)
                    }
                }
            }
            .padding()

            Divider()

            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(EventSymbols.symbolNames, id: \.self) { symbol in
                        Button {
                            event.symbol = symbol
                        } label: {
                            Image(systemName: symbol)
                                .imageScale(.large)
                                .foregroundColor(selectedColor)
                                .padding(5)
                        }
                    }
                }
                .drawingGroup()
            }
        }
        .onAppear {
            selectedColor = event.color
        }
    }
}
