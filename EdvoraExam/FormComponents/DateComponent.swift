//
//  DateComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

class DateComp: ObservableObject {
    @Published var text = ""
}

struct DateComponent: View {
    @ObservedObject var dateComp = DateComp()
    @State private var showDatePicker = false
    @State private var selectedDate = Date()
    
    var body: some View {
        HStack {
            Text("Date:")
            Spacer()
        }
        HStack {
//            ZStack {
//                if self.showDatePicker {
//                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
//                }
//            }
            TextField("", text: $dateComp.text, onEditingChanged: { (editing) in
                showDatePicker = true
            })
                .placeholder(when: dateComp.text.isEmpty) {
                HStack {
                    Text("DD / MM /YYYY").foregroundColor(brownColor)
                    .opacity(0.4)
                    Image(systemName: "calendar")
                        .resizable()
                        .foregroundColor(brownColor)
                        .frame(width: 20, height: 20)
                    }
                }
                .foregroundColor(brownColor)
                .padding()
                .background(formGrayColor)
                .cornerRadius(6)
        }
    }
}

struct DateComponent_Previews: PreviewProvider {
    static var previews: some View {
        DateComponent()
    }
}
