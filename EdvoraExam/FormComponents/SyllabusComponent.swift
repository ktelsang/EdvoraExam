//
//  SyllabusComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

class SyllabusComp: ObservableObject {
    @Published var text = ""
}

struct SyllabusComponent: View {
    @ObservedObject var syllabusComp = SyllabusComp()
    
    var body: some View {
        Text("Syllabus:")
        TextField("", text: $syllabusComp.text)
            .placeholder(when: syllabusComp.text.isEmpty) {
                    Text("Enter modules here").foregroundColor(brownColor)
                    .opacity(0.4)
            }
            .padding()
            .background(formGrayColor)
            .cornerRadius(6)
            .foregroundColor(brownColor)
    }
}

struct SyllabusComponent_Previews: PreviewProvider {
    static var previews: some View {
        SyllabusComponent()
    }
}
