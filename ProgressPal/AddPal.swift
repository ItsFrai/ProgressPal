//
//  AddPal.swift
//  ProgressPal
//
//  Created by Fraidoon Pourooshasb on 6/22/23.
//

import SwiftUI

struct AddPal: View {
    
    @Binding var isPresented: Bool
    @State private var name = ""
    @State private var frequency = "Daily"
    @State private var DateNow = Date.now
    @State private var enableHourClock = false
    @State private var notes = ""
    @State private var showTitleError = false
    @ObservedObject var habits: Habits
    @FocusState private var isFocused: Bool
    @AppStorage("FraiMode") private var FraiMode = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    

    
    
    let frequencies = ["Hourly", "Daily", "Weekly", "Monthly"]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    Spacer()
                    
                    Form {
                        TextField("Habit", text: $name).focused($isFocused)
                        
                        
                        Picker(selection: $frequency, content: {
                            ForEach(frequencies, id: \.self) {
                                Text($0)
                            }
                        }, label: {
                            Text("Frequency")
                        })
                        
                        Toggle(isOn: $enableHourClock, label: {
                            Text("Enable Hour Clock")
                        })
                        
                        if enableHourClock {
                           DatePicker(selection: $DateNow
                                      , label: {
                               Text("Finish Date")
                           })
                        } else {
                            DatePicker(selection: $DateNow, displayedComponents: [.date], label: {
                                Text("Finish Date")
                            })
                            
                        }
                        
                        
                        Section(header: Text("Habit Details").foregroundColor(.primary).font(.system(size: 15))) {
                            TextEditor(text: $notes)
                                .frame(height: 120)
                                .cornerRadius(8)
                        }
                    }
                    .navigationTitle("Add Your Habit Here!")
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        if !name.isEmpty {
                            isPresented = false
                            let item = HabitItem(name: name, frequency: frequency, DateNow: DateNow, notes: notes)
                            habits.items.append(item)
                        } else {
                            showTitleError = true
                        }
                    }, label: {
                        Text("Save").foregroundColor(.primary)
                    })
                }
            }

            .alert(isPresented: $showTitleError) {
                    Alert(title: Text("Missing Title"), message: Text("Please enter a title for your habit."), dismissButton: .default(Text("OK")))
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

struct AddPal_Previews: PreviewProvider {
    
    @State static var isPresented = false
    
    static var previews: some View {
        AddPal(isPresented: $isPresented, habits: Habits())
    }
}
