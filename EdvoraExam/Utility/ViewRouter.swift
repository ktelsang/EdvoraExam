//
//  ViewRouter.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 26/11/21.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .page1
    @Published var tabSelection: Int = 1
}
