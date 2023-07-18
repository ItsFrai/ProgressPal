//
//  HomePageView.swift
//  ProgressPal
//
//  Created by Fraidoon Pourooshasb on 6/22/23.
//

import SwiftUI

struct HomePageView: View {
    
    @StateObject var habits = Habits()
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State private var showingSheet = false
    var body: some View {
        NavigationView {
            ZStack {
                
                List {
                    ForEach(habits.items) { item in
                        HabitRow(habit: item)
                    }
                    .onDelete(perform: removeItems)
                }
                .navigationTitle("ProgressPal")
                .toolbar {
                    Button(action: {
                        showingSheet = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                    EditButton()
                }
                .sheet(isPresented: $showingSheet, content: {
                    AddPal(isPresented: $showingSheet, habits: habits)
                })
            }
            .scrollContentBackground(.hidden)
        }
    }
    func resetAllHabits() {
        habits.items = []
        
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
    }


struct HabitRow: View {
    let habit: HabitItem

    var body: some View {
        NavigationLink(destination: HabitDetailsView(habits: Habits(), habit: habit)) {
            VStack(alignment: .leading) {
                Text("\(habit.name)")
                Text("\(habit.dateString)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
