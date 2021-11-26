//
//  CreateNewExamView.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

struct CreateNewExamView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        
        VStack {
            ZStack {
                VStack {
                    grayColor
                        .edgesIgnoringSafeArea(.top)
                }
                .padding(.bottom, 10)
                VStack {
                    Spacer()
                    FormHeaderComponent()
                }
                .padding(.bottom, 10)
            }
            
            VStack {
                
                HStack {
                    ClassroomComponent()
                }
                .padding()
                .padding(.top, -20)
                
                HStack {
                    SyllabusComponent()
                }
                .padding()
                .padding(.top, -20)
                
                HStack {
                    DateComponent()
                }
                .padding()
                .padding(.top, -20)
                
                HStack {
                    TimeComponent()
                }
                .padding()
                .padding(.top, -20)
                
                HStack {
                    DuartionComponent()
                }
                .padding()
                .padding(.top, -20)
                
                HStack {
                    TimeframeComponent()
                }
                .padding()
                .padding(.top, -20)
                
                HStack {
                    TotalMarksComponent()
                }
                .padding()
                .padding(.top, -20)
                
                HStack {
                    CategoryComponent()
                }
                .padding()
                .padding(.top, -20)
            }
            .padding(.bottom, 60)
            
            SepeartorView()
                .padding(.bottom, 25)
        }
    }
}
                
struct CreateNewExamView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewExamView().environmentObject(ViewRouter())
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
