//
//  HabitDetailsView.swift
//  ProgressPal
//
//  Created by Fraidoon Pourooshasb on 7/17/23.
//

import SwiftUI

struct HabitDetailsView: View {
    
    @ObservedObject var habits: Habits
    var habit: HabitItem
    


    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Name: \(habit.name)")
                Text("Frequency: \(habit.frequency)")
                Text("Date: \(habit.dateString)")
                Text("Notes: \(habit.notes)")
                
            }
            .padding()
            .navigationTitle("\(habit.name) Details")
        }
    }
}

#Preview {
    HabitDetailsView(habits: Habits(),habit: HabitItem(name: "Example Habit", frequency: "Daily", DateNow: Date(), notes: "This is an example habit"))
}
