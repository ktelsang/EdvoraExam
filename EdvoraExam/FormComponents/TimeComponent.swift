//
//  TimeComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

class TimeComp: ObservableObject {
    @Published var text = ""
}

struct TimeComponent: View {
    @ObservedObject var timeComp = TimeComp()
    
    var body: some View {
        HStack {
            Text("Time:")
            Spacer()
        }
        HStack {
            TextField("", text: $timeComp.text)
                .placeholder(when: timeComp.text.isEmpty) {
                    HStack {
                        Text("HR : MN : SC ").foregroundColor(brownColor)
                        .opacity(0.4)
                        Image(systemName: "clock")
                            .resizable()
                            .foregroundColor(brownColor)
                            .frame(width: 20, height: 20)
                    }
                        
                }
                .padding()
                .background(formGrayColor)
                .cornerRadius(6)
                .foregroundColor(brownColor)
        }
    }
}

struct TimeComponent_Previews: PreviewProvider {
    static var previews: some View {
        TimeComponent()
    }
}
