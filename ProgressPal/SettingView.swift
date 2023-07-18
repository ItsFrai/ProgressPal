//
//  SettingView.swift
//  ProgressPal
//
//  Created by Fraidoon Pourooshasb on 6/22/23.
//

import SwiftUI


struct SettingView: View {
    @State private var enableVibration = true
    @State private var selectedNotificationSound = "Default"
    @State private var enableCloudBackup = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var resetHabitsAlert = false
    

    


    var body: some View {
        NavigationView {
            
                Form {
                    Section(header: Text("Account")) {
                        NavigationLink(destination: AccountInfo()) {
                            Text("User Information")
                        }
                    }
                    
                    
                    Section(header: Text("Appearance")) {
                        Toggle("Dark Mode", isOn: $isDarkMode.animation())
                    }
                    
                    Section(header: Text("Data - COMING SOON")) {
                        Toggle("Backup to Cloud", isOn: $enableCloudBackup)
                        Button("Import Data") {
                        }
                        Button("Export Data") {
                        }
                    }
                    Section {
                        Button("Privacy Policy") {
                            
                        }
                        Button("Rate the App") {
                            
                        }
                        
                    }
                    Section {
                        Button("Reset All Habits") {
                            resetHabitsAlert = true
                        }
                        .foregroundColor(.red)
                    }
                    
                }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .alert(isPresented: $resetHabitsAlert) {
                    Alert(
                        title: Text("Reset All Habits"),
                        message: Text("Are you sure you want to reset all habits?"),
                        primaryButton: .destructive(Text("Reset")) {
                            HomePageView().resetAllHabits()
                        },
                        secondaryButton: .cancel()
                    )
                }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

