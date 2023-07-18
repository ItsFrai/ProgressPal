//
//  ProgressPalApp.swift
//  ProgressPal
//
//  Created by Fraidoon Pourooshasb on 6/22/23.
//

import SwiftUI

@main
struct ProgressPalApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                
            
        }
    }
}
