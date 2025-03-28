//
//  DataService.swift
//  HabitTracker
//
//  Created by Della Anjeh on 3/27/25.
//

import Foundation


class DataService: ObservableObject {
    
    @Published var habits: [Habit] = [] {
        didSet {
            saveData()
        }
    }
    
    init() {
        Task {
            await loadData()
        }
    }
    
    private let dataKey = "HabitData"
    
    func saveData() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(habits) {
            UserDefaults.standard.set(data, forKey: dataKey)
        }
    }
    
    func deleteHabit(indexSet: IndexSet) {
        habits.remove(atOffsets: indexSet)
    }
    
    func loadData() async {
        if let savedHabits = UserDefaults.standard.data(forKey: dataKey) {
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits) {
                self.habits = decodedHabits
                return
            }
        }
    }
    
}
