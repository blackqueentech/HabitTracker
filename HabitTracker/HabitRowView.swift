//
//  HabitRowView.swift
//  HabitTracker
//
//  Created by Della Anjeh on 3/27/25.
//

import SwiftUI

struct HabitRowView: View {
    let habit: Habit
    let categoryMap: [String:[String]] = [
        "financial": ["💵", "GreenColor"],
        "health": ["🍎", "BlueColor"],
        "career": ["💼", "YellowColor"]
    ]
    var body: some View {
        HStack {
            Text(categoryMap[habit.category]?[0] ?? "⬜")
                .font(Font.system(size: 25))
            Text(habit.title)
                .font(Font.system(size: 20))
                .fontWeight(.bold)
            Spacer()
            Image(systemName: habit.isCompletedToday ? "checkmark.circle.fill" : "checkmark.circle")
                .foregroundStyle(habit.isCompletedToday ? Color("AccentColor") : Color.gray)
                .font(Font.system(size: 30))
        }
        .padding(10)
        .frame(height: 75)
        .background(Color(categoryMap[habit.category]?[1] ?? "AccentColor"))
        .cornerRadius(25)
    }
}

#Preview {
    HabitRowView(habit: Habit.mock)
}
