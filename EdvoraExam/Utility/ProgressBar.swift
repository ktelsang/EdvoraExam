//
//  ProgressBar.swift
//  EdvoraExam
//
//  Created by kavyashree SHRIPAD HEGDE on 21/11/21.
//

import SwiftUI

struct ProgressBarView: View {
    @State var progressValue: Float = 0.62
    @EnvironmentObject var subjectDetails: SubjectDetails
    
    var body: some View {
        ZStack {
            Color.white
                .opacity(0.1)
                .frame(width: 100, height: 100)
            let calculatePercent = CalculatePercentage(totalClass: Double(subjectDetails.totalClass) ?? 0.0, attendedClass: Double(subjectDetails.classAttended) ?? 0.0)
            
            VStack {
                ProgressBar(progress: calculatePercent.getPercentage())
                    .frame(width: 90.0, height: 90.0)
                    .padding(30.0)
            }
        }
    }
}

class CalculatePercentage : ObservableObject {
    var totalClass = 0.0
    var attendedClass = 0.0
    
    init(totalClass: Double, attendedClass: Double){
        self.totalClass = totalClass
        self.attendedClass = attendedClass
    }
    
    func getPercentage() -> Float {
        var percentage = attendedClass / totalClass
        return Float(percentage)
    }
}

struct ProgressBar: View {
    var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(Color.gray)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.green)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)

            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                .font(.title)
                .foregroundColor(Color.green)
                .bold()
        }
    }
}


struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView()
    }
}
