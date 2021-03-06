//
//  CreateNextExam.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

struct CreateNextExam: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack {
            AddInstructionComponent()
            Spacer()
        }
    }
}

struct CreateNextExam_Previews: PreviewProvider {
    static var previews: some View {
        CreateNextExam().environmentObject(ViewRouter())
    }
}
