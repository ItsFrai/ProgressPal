//
//  HabitItem.swift
//  ProgressPal
//
//  Created by Fraidoon Pourooshasb on 6/22/23.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    
    var id = UUID()
    let name: String
    let frequency: String
    let DateNow: Date
    let notes: String
    
    var dateString: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd/yyyy"
            return formatter.string(from: DateNow)
        }
}
