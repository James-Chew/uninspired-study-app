//
//  viewModel.swift
//  studyapp
//
//  Created by James on 17/6/25.
//
import Foundation

class ExamData: ObservableObject {
    @Published var exams: [ExamEntry] = []
    
    func addExam(subject: String, exam: String, marks: String, weightage: String) {
        if let marksValue = Double(marks), let weightValue = Double(weightage) {
            let newExam = ExamEntry(subject: subject, marks: marksValue, weightage: weightValue, exam: exam)
            exams.append(newExam)
        }
    }

}
