//
//  ContentView.swift
//  Shared
//
//  Created by TeU on 2022/6/5.
//

import SwiftUI

struct EventList: View {
    @EnvironmentObject var eventData: EventData
    @EnvironmentObject private var _viewModel: AuthViewModel

    @State private var _newEvent = Event()
    @State private var _isAddingNewEvent = false

    var body: some View {
        List {
            ForEach(Period.allCases) { period in
                let sortedEvents = eventData.sortedEvents(period: period)

                if !sortedEvents.isEmpty {
                    Section (content: {
                        ForEach(sortedEvents) { $event in
                            NavigationLink {
                                EventEditor(event: $event)
                            } label: {
                                 EventRow(event: event)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    eventData.delete(event)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }, header: {
                        Text(period.name)
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                    })
                }
            }
        }
        .navigationTitle("SwifToDo, Hi \(_viewModel.currentUser?.displayName ?? "")")
        .toolbar {
            ToolbarItem {
                Button {
                    _newEvent = Event()
                    _isAddingNewEvent = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $_isAddingNewEvent) {
            NavigationView {
                EventEditor(event: $_newEvent, isNew: true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
    }
}
