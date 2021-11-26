//
//  FormHeaderSaveComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 24/11/21.
//

import SwiftUI

struct FormHeaderSaveComponent: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .bottom) {
                    Button(action: {
                        withAnimation {
                            viewRouter.currentPage = .page1
                            viewRouter.tabSelection = 2
                        }
                    }, label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .padding()
                            .foregroundColor(Color(.systemBrown))
                            .frame(width: 50, height: 50, alignment: .trailing)
                    })
                        .padding(.bottom,4)
                    
                    HStack() {
                        Text("Create New Exam")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .foregroundColor(smokeBlackColor)
                            .padding()
                        Spacer()
                    }

                    Button("Save"){

                    }
                    .padding()
                    .frame(width: 70, height: 35, alignment: .center)
                    .foregroundColor(brownColor)
                    .background(Color.clear)
                    .cornerRadius(10)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .overlay(RoundedRectangle(cornerRadius: 4.0).stroke(brownColor, lineWidth: 1))
                    .padding(.bottom, 10)
                    .opacity(0.6)
                    
                    Spacer()
                }
            }
        }
    }
}

struct FormHeaderSaveComponent_Previews: PreviewProvider {
    static var previews: some View {
        FormHeaderSaveComponent().environmentObject(ViewRouter())
    }
}
