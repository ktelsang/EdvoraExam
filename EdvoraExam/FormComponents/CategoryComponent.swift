//
//  CategoryComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 22/11/21.
//

import SwiftUI

class CategoryComp: ObservableObject {
    @Published var text = ""
}

struct CategoryComponent: View {
    @ObservedObject var categoryComp = CategoryComp()
    
    var body: some View {
        HStack {
            Text("Category:")
            Spacer()
        }
        HStack {
            TextField("", text: $categoryComp.text)
                .placeholder(when: categoryComp.text.isEmpty) {
                    HStack {
                        Text(" Internal, mocks, etc ").foregroundColor(brownColor)
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

struct CategoryComponent_Previews: PreviewProvider {
    static var previews: some View {
        CategoryComponent()
    }
}
