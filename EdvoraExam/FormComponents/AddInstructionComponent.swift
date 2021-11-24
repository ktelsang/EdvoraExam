//
//  AddInstructionComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

class AddInstructionComp: ObservableObject {
    @Published var text = ""
}

struct AddInstructionComponent: View {
    @ObservedObject var addInstructionComp = AddInstructionComp()
    
    var body: some View {
        Text("Add Instruction")
            .padding()
        TextField("", text: $addInstructionComp.text)
            .padding()
            .background(formGrayColor)
            .cornerRadius(6)
    }
}

struct AddInstructionComponent_Previews: PreviewProvider {
    static var previews: some View {
        AddInstructionComponent()
    }
}
