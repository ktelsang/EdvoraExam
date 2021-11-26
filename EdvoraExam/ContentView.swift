//
//  ContentView.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 20/11/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewRouter = ViewRouter()
    
    var body: some View {
        TabView(selection: $viewRouter.tabSelection) {
            DashboardView()
            
                .tabItem {
                    Image(systemName: "square.stack.3d.down.right.fill")
                    Text("Dashboard")
                }
                .tag(1)
            
                ExamView().environmentObject(viewRouter)
                .tabItem{Image(systemName: "graduationcap")
                    Text("Exams")
                }
                .tag(2)
            
        }
        .accentColor(brownColor)
    }
}

