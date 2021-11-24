//
//  DuartionComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

class DurationComp: ObservableObject {
    @Published var text = ""
}

struct DuartionComponent: View {
    @ObservedObject var durationComp = DurationComp()
    
    var body: some View {
        HStack {
            Text("Duration:")
            Spacer()
        }
        HStack {
            TextField("", text: $durationComp.text)
                .placeholder(when: durationComp.text.isEmpty) {
                    HStack {
                        Text(" HR | MN ").foregroundColor(brownColor)
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

struct DuartionComponent_Previews: PreviewProvider {
    static var previews: some View {
        DuartionComponent()
    }
}
