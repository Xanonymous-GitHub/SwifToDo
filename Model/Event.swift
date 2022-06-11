//
//  Event.swift
//  swiftodo
//
//  Created by TeU on 2022/6/6.
//

import Foundation

struct Event: Identifiable, Hashable {
    let id = UUID()
    var symbol = EventSymbols.randomName()
    var color = ColorOptions.random()
    var title = ""
    var tasks = [EventTask(text: "")]
    var date = Date.now

    var containsEmptyTextCount: Int {
        tasks.filter { $0.text.isEmpty }.count
    }

    var remainingTaskCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }

    var isComplete: Bool {
        tasks.allSatisfy { $0.isCompleted }
    }

    var isPast: Bool {
        date < Date.now
    }

    var isWithinSevenDays: Bool {
        !isPast && date < Date.now.someDaysOut(days: 7)
    }

    var isDistant: Bool {
        date >= Date.now.someDaysOut(days: 30)
    }

    var isWithinSevenToThirtyDays: Bool {
        !isPast && !isWithinSevenDays && !isDistant
    }
}

private extension Date {
    func someDaysOut(days: Int) -> Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: days, to: self) ?? self
    }
}
