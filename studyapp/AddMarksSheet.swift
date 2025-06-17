//
//  AddMarksSheet.swift
//  studyapp
//
//  Created by James on 17/6/25.
//

import SwiftUI

struct AddMarksSheetView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var examData: ExamData
    
    @State private var marks = ""
    @State private var weightage = ""
    @State private var subject = ""
    @State private var exam = ""
    
    let exams = ["Math", "Science", "History", "English", "Literature", "Chinese", "Geography"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Exam Details")) {
                    Picker("Subject", selection: $subject) {
                        ForEach(exams, id: \.self) { exam in
                            Text(exam)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    TextField("Marks", text: $marks)
                        .keyboardType(.decimalPad)
                    
                    TextField("Weightage Percentage", text: $weightage)
                        .keyboardType(.decimalPad)
                    TextField("Exam", text: $exam)
                }
                
                Section(header: Text("Actions")) {
                    Button("Save") {
                        examData.addExam(subject: subject, exam: exam, marks: marks, weightage: weightage)
                        dismiss()
                    }
                    .foregroundColor(.green)
                    
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
}


#Preview {
    AddMarksSheetView()
}
