//
//  SectionComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

class SectionTitleComp: ObservableObject {
    @Published var text = ""
}

class SectionDescComp: ObservableObject {
    @Published var text = ""
}

struct SectionComponent: View {
    @ObservedObject var sectionTitleComp = SectionTitleComp()
    @ObservedObject var sectionDescComp = SectionDescComp()
    
    var body: some View {
        Text("Section Name")
        TextField("", text: $sectionTitleComp.text)
            .padding()
            .background(formGrayColor)
            .cornerRadius(6)
        TextField("", text: $sectionDescComp.text)
            .padding()
            .background(formGrayColor)
            .cornerRadius(6)
    }
}

struct SectionComponent_Previews: PreviewProvider {
    static var previews: some View {
        SectionComponent()
    }
}
