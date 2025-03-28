//
//  NoHabitsView.swift
//  HabitTracker
//
//  Created by Della Anjeh on 3/27/25.
//

import SwiftUI

struct NoHabitsView: View {
    var dataService: DataService
    @State private var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Text("You haven't added any habits yet")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Let this be an opportunity to train your mind and build discipline. So much can happen when you commit to taking the first step! 💪")
                    .padding(.bottom, 15)
                NavigationLink(destination: AddHabitView(dataService: dataService), label: {
                    Text("Add Your First Habit")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 200, height: 55)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(15)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0.0,
                    y: 0.0
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                //.offset(y: animate ? -7 : 0)
                
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoHabitsView(dataService: DataService())
}
