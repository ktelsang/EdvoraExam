//
//  AddInstructionComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

class AddInstructionComp: ObservableObject {
    @Published var text = ""
    @Published var sectiontext = ""
    @Published var sectionDesctext = ""
}

class AddQuestionFeild: ObservableObject {
    @Published var addQuestion: [AddQuestionComponent] = []
}

struct AddInstructionComponent: View {
    @ObservedObject var addInstructionComp = AddInstructionComp()
    @ObservedObject var addSectionTitle = AddInstructionComp()
    @ObservedObject var addSectionDescription = AddInstructionComp()
    @ObservedObject var addQuestionField = AddQuestionFeild()

    var body: some View {
        
        ScrollView(.vertical) {
        VStack{
            ZStack {
                grayColor
                    .edgesIgnoringSafeArea(.top)
                FormHeaderSaveComponent()
                
            }
            VStack{
                VStack{
                    HStack {
                        Text("Add Instruction")
                            .padding()
                            .frame(width: 200, height: 50, alignment: .leading)
                        Spacer()
                    }
                    .padding(.leading, 10)
                    
                    TextField("", text: $addInstructionComp.text)
                        .padding()
                        .frame(width: 350, height: 50, alignment: .center)
                        .background(formGrayColor)
                        .cornerRadius(8)
                }
                VStack{
                    HStack {
                        Text("Section Name")
                            .padding()
                            .frame(width: 200, height: 50, alignment: .leading)
                        Spacer()
                    }
                    .padding(.leading, 10)
                    TextField("Section title", text: $addSectionTitle.sectiontext)
                        .padding()
                        .frame(width: 350, height: 50, alignment: .center)
                        .background(formGrayColor)
                        .cornerRadius(8)
                    TextField("Section Description(optional)", text: $addSectionDescription.sectionDesctext)
                        .padding()
                        .frame(width: 350, height: 100, alignment: .top)
                        .background(formGrayColor)
                        .cornerRadius(8)
                }
    
                AddQuestionComponent()
                VStack{
                    Button("Add question"){
                        
                    }.padding()
                    
                        .foregroundColor(brownColor)
                        .frame(width: 350, height: 50, alignment: .top)
                        .background(lightBrownColor)
                        .cornerRadius(8)
                    
                    Button("Add another section"){
                        
                    }.padding()
                        .frame(width: 350, height: 50, alignment: .top)
                        .background(lightBrownColor)
                        .cornerRadius(8)
                        .foregroundColor(brownColor)
                }
            }
        }
    }
    }
}

struct AddInstructionComponent_Previews: PreviewProvider {
    static var previews: some View {
        AddInstructionComponent()
    }
}
