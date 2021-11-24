//
//  TotalMarksComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

class TotalMarksComp: ObservableObject {
    @Published var text = ""
}

struct TotalMarksComponent: View {
    @ObservedObject var totalMarksComp = TotalMarksComp()
    
    var body: some View {
        HStack {
            Text("Total Marks:")
            Spacer()
        }
        HStack {
            TextField("", text: $totalMarksComp.text)
                .placeholder(when: totalMarksComp.text.isEmpty) {
                    HStack {
                        Text("").foregroundColor(brownColor)
                        .opacity(0.4)
                    }
                        
                }
                .padding()
                .background(formGrayColor)
                .cornerRadius(6)
                .foregroundColor(brownColor)
        }
    }
}

struct TotalMarksComponent_Previews: PreviewProvider {
    static var previews: some View {
        TotalMarksComponent()
    }
}
