//
//  HabitModel.swift
//  HabitTracker
//
//  Created by Della Anjeh on 3/27/25.
//

import Foundation

struct Habit: Identifiable, Codable, Equatable {
    let id: String
    var title: String
    var category: String
    var description: String
    var completionCount: Int
    var isCompletedToday: Bool
    
    init(id: String = UUID().uuidString, title: String, category: String, description: String, completionCount: Int = 0, isCompletedToday: Bool = false) {
        self.id = id
        self.title = title
        self.category = category
        self.description = description
        self.completionCount = completionCount
        self.isCompletedToday = isCompletedToday
    }
    
    static var mock: Habit {
        Habit(title: "Taking pilates class", category: "health", description: "Going to my pilates studio and taking class. It's so hard but worth it!", completionCount: 34, isCompletedToday: true)
    }
}
