//
//  ContentView.swift
//  ProgressPal
//
//  Created by Fraidoon Pourooshasb on 6/22/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
            VStack {
                TabView {
                    HomePageView()
                        .tabItem() {
                            Image(systemName: "house")
                            Text("Home").bold()
                        }
                    SleepTracker()
                        .tabItem() {
                            Image(systemName:"powersleep")
                            Text("Sleep Pal").bold()
                        }
                    SettingView()
                        .tabItem() {
                            Image(systemName: "gear")
                            Text("Settings").bold()
                    }
                }
                .onAppear() {
                    UITabBar.appearance().backgroundColor = .lightGray
                }
            }
        }
    }


                

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
