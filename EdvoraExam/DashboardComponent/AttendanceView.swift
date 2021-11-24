//
//  AttendanceView.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 21/11/21.
//

import SwiftUI

class SubjectDetails : ObservableObject {
    
    @Published var totalClass: String = ""
    @Published var classAttended: String = ""
    @Published var classMissed: String = ""
    @Published var classLeft: String = ""
    
    init(totalClass: String, classAttended: String, classMissed: String, classLeft: String){
        self.totalClass = totalClass
        self.classLeft = classLeft
        self.classMissed = classMissed
        self.classAttended = classAttended
        
    }
}

struct AttendenceView: View {
    var subjectDetails = SubjectDetails(totalClass: "33", classAttended: "18", classMissed: "35", classLeft: "36")
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Attendance").foregroundColor(smokeBlackColor)
                .font(.system(size: 22, weight: .semibold, design: .default))
                .padding()
                .padding(.bottom, -15)
            DropDownView(subjectDetails: subjectDetails)
            HStack {
                ProgressBarView()
                        .environmentObject(subjectDetails)
                AttendanceDetailView().environmentObject(subjectDetails)
            }
            .padding(.top, -20)
            
            AttendanceAlertView().environmentObject(subjectDetails)
            
            Spacer()
        }
        .padding(.all)
    }
}

struct AttendanceAlertView: View {
    @EnvironmentObject var subjectDetails: SubjectDetails
    
    var percentage: Double {
        return Double(subjectDetails.classAttended)! / Double(subjectDetails.totalClass)!
    }
    
    var body: some View {
        if percentage < 0.75 {
            HStack(alignment: .center) {
                Image(systemName: "bell")
                    .resizable()
                        .padding()
                    .foregroundColor(navyblueColor)
                        .frame(width: 50, height: 50, alignment: .trailing)
                        
                Text("Your attendance seems to be low in this subject")
                    .lineLimit(2)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .foregroundColor(navyblueColor)
                    .background(lightblueColor)
                    .cornerRadius(5)
                Spacer()
            }
            .background(lightblueColor)
            .cornerRadius(5)
        }
    }
}

struct AttendanceDetailView: View {
    
    @EnvironmentObject var subjectDetails: SubjectDetails
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Text("Total Class")
                    .padding(.trailing, 1)
                    .font(.system(size: 18, weight: .regular, design: .default))
                    .foregroundColor(Color.gray)
                Spacer()
                Text(subjectDetails.totalClass)
                    .padding(.leading)
                    .font(.system(size: 18, weight: .regular, design: .default))
            }
            HStack() {
                Text("Class Attended")
                    .font(.system(size: 18, weight: .regular, design: .default))
                    .foregroundColor(Color.gray)
                Spacer()
                Text(subjectDetails.classAttended)
                    .padding(.leading)
                    .font(.system(size: 18, weight: .regular, design: .default))
            }
            HStack {
                Text("Class Missed")
                    .font(.system(size: 18, weight: .regular, design: .default))
                    .foregroundColor(Color.gray)
                Spacer()
                Text(subjectDetails.classMissed)
                    .font(.system(size: 18, weight: .regular, design: .default))
            }
            HStack {
                Text("Class Left")
                    .padding(.trailing, 7)
                    .font(.system(size: 18, weight: .regular, design: .default))
                    .foregroundColor(Color.gray)
                Spacer()
                Text(subjectDetails.classLeft)
                    .font(.system(size: 18, weight: .regular, design: .default))
            }
        }
    }
}

struct DropDownView: View {
    var subjectDetails: SubjectDetails
    
    @State private var isExpanded = false
    @State private var selectedItem = "Data Structure & Algorithms"
    @State private var subjectNameArray = ["Data Structure & Algorithms", "NodeJS", "SwiftUI", "Angular"]
    var totalClasses = ["40", "50", "60", "70"]
    var classesAttended = ["20", "48", "55", "45"]
    var classesMissed = ["10", "2", "8", "9"]
    var classesLeft = ["3", "5", "6", "7"]

    var body: some View {
        DisclosureGroup("\(selectedItem)", isExpanded: $isExpanded) {
            ScrollView{
                VStack{
                    ForEach(0..<subjectNameArray.count, id: \.self) {
                        sub in Text("\(subjectNameArray[sub])")
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 18, weight: .regular, design: .default))
                            .padding(.bottom,1)
                            .onTapGesture {
                                self.selectedItem = subjectNameArray[sub]
                                
                                subjectDetails.totalClass = totalClasses[sub]
                                subjectDetails.classLeft = classesLeft[sub]
                                subjectDetails.classMissed = classesMissed[sub]
                                subjectDetails.classAttended = classesAttended[sub]
                                
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
        .font(.system(size: 18, weight: .regular, design: .default))
            .foregroundColor(brownColor)
            .padding(.all)
            .background(Color.white)
    }
}

struct AttendanceView_Previews: PreviewProvider {
    static var previews: some View {
        AttendenceView()
    }
}
