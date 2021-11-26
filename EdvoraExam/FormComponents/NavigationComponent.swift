//
//  NavigationComponent.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 24/11/21.
//

import SwiftUI

struct NavigationComponent: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: CreateNextExam()){
                }
            }
        }
    }
}

struct NavigationComponent_Previews: PreviewProvider {
    static var previews: some View {
        NavigationComponent()
    }
}
