//
//  DashboardView.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 20/11/21.
//

import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        VStack {
            HeaderView()
            ExamListView()
                .padding(.top, -30)
            SepeartorView()
                .padding(.top, -10)
            AttendenceView()
                .padding(.top, -30)
            SepeartorView()
                .padding(.top, -20)
            Spacer()
        }
    }
}

struct SepeartorView: View {
    var body: some View {
        grayColor
            .frame(height: 10)
    }
}

struct HeaderView: View {
    var body: some View {
        
        ZStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Hello Harry")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .foregroundColor(brownColor)
                    Text("Welcome to your Dashboard")
                        .font(.system(size: 18, weight: .thin, design: .rounded))
                        .foregroundColor(brownColor)
                }
                .padding()
                .padding(.top, 40)
                Spacer()
                Image("profile")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 80, height: 70, alignment: .trailing)
                    .padding(.top, 50)
                    .padding(.trailing, 10)
                            }
        }
        .background(grayColor)
        .edgesIgnoringSafeArea(.top)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
