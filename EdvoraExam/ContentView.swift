//
//  ContentView.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 20/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
            .tabItem {
                    Image(systemName: "square.stack.3d.down.right.fill")
                    Text("Dashboard")
            }
            
            CreateNewExamView()
                .tabItem {
                    Image(systemName: "graduationcap")
                    Text("Exams")
                }
        }
        .accentColor(brownColor)
    }
}

