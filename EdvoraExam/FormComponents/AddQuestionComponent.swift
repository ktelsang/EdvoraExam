//
//  AddQuestionComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

class AddQuestionComp: ObservableObject {
    @Published var questiontext = ""
}

class OptionFeild: ObservableObject {
    @Published var questionModuleList: [QuestionModule] = []
}

struct QuestionModule: Identifiable {
    var id = UUID()
    var question: String
    var optionName: String
    var optionText: String
}

struct AddQuestionComponent: View {
    @ObservedObject var addQuestion = AddQuestionComp()
    @ObservedObject var optionFeild = OptionFeild()
        
    var body: some View {
    
        VStack {
            TextField("Add question here",text: $addQuestion.questiontext, onEditingChanged: { changed in
                if optionFeild.questionModuleList.count == 0 {
                    let ques = QuestionModule(question: "", optionName: "A", optionText: "")
                    optionFeild.questionModuleList.append(ques)
                }
            })
                .padding(.horizontal, 20).padding(.top, 20)
                .foregroundColor(brownColor)
                .frame(width: 350, height: 50, alignment: .leading)
            Divider()
                .padding(.horizontal, 10)
                .background(brownColor)
            ScrollView(.vertical) {
                ForEach(optionFeild.questionModuleList, id: \.id) { questionMod in
                    QuestionTextFeild(questionModule: questionMod, optionFeild: optionFeild)
                }
            }
            .frame(maxHeight: 300)
            
            HStack{
                Button("Delete"){
                    optionFeild.questionModuleList.removeLast()
                }
                .padding().foregroundColor(brownColor)
                .opacity(0.6)
                .frame(width: 90, height: 40, alignment: .leading)
                Spacer()
                
                Button("Save"){
                    
                }
                .padding()
                .foregroundColor(greenColor)
                .frame(width: 90, height: 40, alignment: .leading)
            }
        }.padding()
            .background(questionbrown)
            .cornerRadius(8)
    }
}

struct QuestionTextFeild: View {
    @State var questionModule: QuestionModule
    @ObservedObject var optionFeild: OptionFeild
    
    var body: some View {
        Group {
            HStack {
                Spacer()
                Circle().fill(questionModule.optionText.isEmpty ? Color.white : brownColor)
                    .frame(width: 15, height: 15, alignment: .leading)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(questionModule.optionText.isEmpty ? .gray : brownColor, lineWidth: 1))
                Label(questionModule.optionName, image: "")
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(brownColor)
                    .background(lightBrownColor)
                    
                TextField("Add question..", text: $questionModule.optionText, onEditingChanged: { editingChanged in
                    
                    let optionCount = optionFeild.questionModuleList.count
                    if optionCount < 4 {
                        var optionName = "A"
                        switch optionCount {
                        case 1:
                            optionName = "B"
                        case 2:
                            optionName = "C"
                        case 3:
                            optionName = "D"
                        default:
                            break
                        }
                        
                        let ques = QuestionModule(question: "", optionName: optionName, optionText: "")
                        optionFeild.questionModuleList.append(ques)
                    }
                })
                .padding()
                
                Spacer()
                ZStack {
                    Button(action: {
                        
                    }, label: {
                            ZStack(alignment: .trailing) {
                                Image(systemName: "plus.circle")
                                    .rotationEffect(Angle(degrees: 90))
                                    .foregroundColor(brownColor)
                                    .padding()
                            }
                        })
                    }
                }
            }
            .overlay(RoundedRectangle(cornerRadius: 4.0).stroke( brownColor, lineWidth: 1))
        }
    }

struct AddQuestionComponent_Previews: PreviewProvider {
    static var previews: some View {
        AddQuestionComponent()
    }
}
