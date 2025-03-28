//
//  ContentView.swift
//  HabitTracker
//
//  Created by Della Anjeh on 3/27/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataService = DataService()
    
    var body: some View {
        NavigationStack {
            ZStack {
                if dataService.habits.isEmpty {
                    NoHabitsView(dataService: dataService)
                } else {
                    List {
                        ForEach(dataService.habits) { habit in
                            NavigationLink {
                                HabitDetailsView(dataService: dataService, habit: habit)
                            } label: {
                                HabitRowView(habit: habit)
                            }
                            .listRowSeparator(.hidden)
                        }
                        .onDelete(perform: dataService.deleteHabit)
                    }
                    .listStyle(.plain)
                }
            }
            .toolbar {
                NavigationLink {
                    AddHabitView(dataService: dataService)
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.black)
                }
            }
            .navigationTitle("Habit Tracker")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
