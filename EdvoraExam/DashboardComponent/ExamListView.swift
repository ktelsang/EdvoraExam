//
//  ExamListView.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 21/11/21.
//

import SwiftUI

struct Examination: Identifiable {
    var id = UUID()
    var examName: String
    var examTime: String
    var examMarks: String
    var examType: String
    var isExamStarted: Bool
}

struct ExamListView: View {
    @State private var examinations = [
        Examination(examName: "Object Oriented Programming", examTime: "2pm - 3pm", examMarks: "25 marks", examType: "MCQs", isExamStarted: false),
        Examination(examName: "Java Programming", examTime: "3pm - 4pm", examMarks: "30 marks", examType: "Viva", isExamStarted: true),
        Examination(examName: "Swift Programming", examTime: "4pm - 5pm", examMarks: "25 marks", examType: "Viva", isExamStarted: true)
    ]
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text("Examinations")
                        .foregroundColor(smokeBlackColor)
                        .font(.system(size: 22, weight: .semibold, design: .default))
                        .padding()
                        .padding(.trailing, 150)
                    Spacer()
                }
                
                Button(action: {
                    let ex = Examination(examName: "Angular Programming", examTime: "1pm - 2pm", examMarks: "40 marks", examType: "MCQs", isExamStarted: false)
                    examinations.append(ex)
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                                .padding()
                            .foregroundColor(Color(.systemBrown))
                                .frame(width: 50, height: 50, alignment: .trailing)
                    })
            }
 
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    ForEach(examinations, id: \.id) { exam in
                        CardView(exam: exam)
                    }
                }
                .padding()
            }
        }
    }
}

struct CardView: View {
    @State var exam: Examination
    
    var body: some View {
        ZStack {
            grayColor
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(exam.examName)
                        .font(.system(size: 25, weight: .medium, design: .default))
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    Button("Take") {
                        // Take Exam
                    }
                    .padding()
                    .frame(width: 80, height: 45, alignment: .center)
                    .foregroundColor(.white)
                    .background(greenColor)
                    .cornerRadius(10)
                    .font(.system(size: 22, weight: .medium, design: .default))
                    .opacity(exam.isExamStarted ? 1 : 0)
                    .padding(.trailing, 10)
                }
                HStack {
                    Text(exam.examTime)
                        .foregroundColor(Color.gray)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .padding(.leading, 10)

                    Spacer()
                    Text(exam.examType)
                        .foregroundColor(Color.gray)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .padding(.trailing, 10)
                
                }.padding(.bottom, 5)
                
                HStack {
                    Text(exam.examMarks)
                        .foregroundColor(Color.gray)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .padding(.leading, 10)
                    Spacer()
                    Text("Internal One")
                        .foregroundColor(brownColor)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .padding(.trailing, 10)
                    
                }
            }
            
        }
        .frame(width: 350, height: 200)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
    }
}

struct ExamListView_Previews: PreviewProvider {
    static var previews: some View {
        ExamListView()
    }
}
