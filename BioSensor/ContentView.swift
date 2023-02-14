//
//  ContentView.swift
//  BioSensor
//
//  Created by Shi Xiang Lim on 1/21/23.
//

import SwiftUI

struct ContentView: View {
    

    @State private var readings =        [
        Reading(
            date:"01/02/03",
            interval:"Test"
        )
        ]
    
    
    @State private var tabSelection = 1
    @State private var buttonPressed = 0
    @State private var currentDate = Date.now
    @State private var textInput = ""
    var body: some View {
        TabView (selection: $tabSelection){
            MainMenu(tabSelection: $tabSelection)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
                .tag(1)
            
            Measurement(currentDate:$currentDate,
                        reading:$readings, textInput:$textInput)
                .tabItem {
                    Label("Measurement", systemImage: "square.and.pencil")
                }
                .tag(2)
            Notification(currentDate:$currentDate)
                .tabItem {
                    Label("Notification", systemImage: "bell.and.waves.left.and.right")
                }
                .tag(3)
            QuickStartGuide()
                .tabItem {
                    Label("Quick Start", systemImage: "gear.badge.questionmark")
                }
                .tag(4)
        }
    }
}

struct Reading: Identifiable {
    let date: String
    let interval:String
    let id = UUID()
}

struct QuickStartGuide: View {
    var body: some View {
        ZStack{
            Color.teal.edgesIgnoringSafeArea([.top])
            VStack{
                Text("This place is for information, ideally in list view")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


