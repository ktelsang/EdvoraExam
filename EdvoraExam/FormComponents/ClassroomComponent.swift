//
//  ClassroomComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

struct ClassroomComponent: View {
    
    @State private var isExpanded = false
    @State private var selectedItem = "Data Structure & Algorithms"
    @State private var subjectNameArray = ["Data Structure & Algorithms", "NodeJS", "SwiftUI", "Angular"]
    
    var body: some View {
        
        Text("Classroom:")
        
        DisclosureGroup("\(selectedItem)", isExpanded: $isExpanded) {
            ScrollView{
                VStack{
                    ForEach(0..<subjectNameArray.count, id: \.self) {
                        sub in Text("\(subjectNameArray[sub])")
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 16, weight: .regular))
                            .opacity(0.5)
                            .padding(.bottom,1)
                            .onTapGesture {
                                self.selectedItem = subjectNameArray[sub]
                    
                                withAnimation{
                                   self.isExpanded.toggle()
                                }
                            }
                    }
                }
            }
            .frame(height: 100)
        }
        .padding(.top, -10)
        .accentColor(brownColor)
        .font(.system(size: 16, weight: .regular))
        .opacity(0.6)
            .foregroundColor(brownColor)
            .padding(.all)
            .background(formGrayColor)
            .cornerRadius(8)
    }
}

struct ClassroomComponent_Previews: PreviewProvider {
    static var previews: some View {
        ClassroomComponent()
    }
}
