//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Della Anjeh on 3/27/25.
//

import SwiftUI

struct AddHabitView: View {
    var dataService: DataService
    let categories = ["health", "career", "financial"]
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var selectedCategory: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Form {
                Picker("Pick a category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Add your habit title", text: $title)
                TextField("Write a description for this habit", text: $description)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save Habit") {
                        let habit = Habit(title: title, category: selectedCategory, description: description)
                        dataService.habits.append(habit)
                        dismiss()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddHabitView(dataService: DataService())
}
