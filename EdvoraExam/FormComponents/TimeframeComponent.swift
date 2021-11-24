//
//  TimeframeComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

class TimeframeComp: ObservableObject {
    @Published var text = ""
}

struct TimeframeComponent: View {
    @ObservedObject var timeframeComp = TimeframeComp()
    
    var body: some View {
        HStack {
            Text("Timeframe:")
            Spacer()
        }
        HStack {
            TextField("", text: $timeframeComp.text)
                .placeholder(when: timeframeComp.text.isEmpty) {
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

struct TimeframeComponent_Previews: PreviewProvider {
    static var previews: some View {
        TimeframeComponent()
    }
}
