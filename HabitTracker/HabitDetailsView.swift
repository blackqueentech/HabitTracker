//
//  HabitDetailsView.swift
//  HabitTracker
//
//  Created by Della Anjeh on 3/27/25.
//

import SwiftUI

struct HabitDetailsView: View {
    let dataService: DataService
    let habit: Habit
    let categoryMap: [String:[String]] = [
        "financial": ["💵", "GreenColor"],
        "health": ["🍎", "BlueColor"],
        "career": ["💼", "YellowColor"]
    ]
    var body: some View {
        VStack(spacing: 15) {
            Text(categoryMap[habit.category]![0])
                .font(Font.system(size:50))
            Text(habit.title)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(habit.description)
                .italic()
                .padding(15)
                .frame(minWidth: 400, minHeight: 100)
                .background(Color(categoryMap[habit.category]![1]))
                .cornerRadius(20)
            
            HStack {
                VStack(alignment: .center, spacing: 20) {
                    Text(String(habit.completionCount))
                        .font(Font.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundStyle(Color("GreenColor"))
                    Text("Times Completed")
                        .font(Font.system(size: 20))
                        .foregroundStyle(.gray)
                }
                .padding(10)
                .frame(minWidth: 150, minHeight: 125)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("GreenColor"), lineWidth: 2)
                )
                
                Spacer()
                VStack(alignment: .center, spacing: 10){
                    Text("Mark habit as completed")
                        .font(Font.system(size: 20))
                        .foregroundStyle(.gray)
                    Button {
                        incrementCompletionCount(for: habit)
                    } label: {
                        Image(systemName: habit.isCompletedToday ? "checkmark.circle.fill" : "checkmark.circle")
                            .foregroundStyle(habit.isCompletedToday ? Color("GreenColor") : Color.gray)
                            .font(Font.system(size: 40))
                    }
                }
                .padding(10)
                .frame(minWidth: 150, minHeight: 125)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("GreenColor"), lineWidth: 2)
                )
        
            }
            .padding()
        }
        .multilineTextAlignment(.center)
    }
    
    func incrementCompletionCount(for habit: Habit) {
        var copyHabit = habit
        copyHabit.isCompletedToday.toggle()
        if copyHabit.isCompletedToday {
            copyHabit.completionCount += 1
        } else {
            guard copyHabit.completionCount > 0 else { return }
            copyHabit.completionCount -= 1
        }
        if var oldHabitIndex = dataService.habits.firstIndex(of: habit) {
            dataService.habits[oldHabitIndex] = copyHabit
            return
        }
        return
    }
}

#Preview {
    HabitDetailsView(dataService: DataService(), habit: Habit.mock)
}
