//
//  TaskRow.swift
//  swiftodo
//
//  Created by TeU on 2022/6/6.
//

import SwiftUI

struct TaskRow: View {
    @Binding var task: EventTask
    var focusedTask: FocusState<EventTask?>.Binding

    var body: some View {
        HStack {
            Button {

            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)

            TextField("task description", text: $task.text)
                .focused(focusedTask, equals: task)

            Spacer()
        }
    }
}
