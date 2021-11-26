//
//  ExamView.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 26/11/21.
//

import SwiftUI

struct ExamView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
                case .page1:
                    CreateNewExamView()
                case .page2:
                    CreateNextExam()
                        .transition(.scale)
                }
        
    }
}

struct ExamView_Previews: PreviewProvider {
    static var previews: some View {
        ExamView().environmentObject(ViewRouter())
    }
}
