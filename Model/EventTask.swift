//
//  EventTask.swift
//  swiftodo
//
//  Created by TeU on 2022/6/6.
//

import Foundation

struct EventTask: Identifiable, Hashable {
    let id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}
