//
//  AddMarksSheet.swift
//  studyapp
//
//  Created by James on 17/6/25.
//

import SwiftUI

struct AddMarksSheetView: View {
    @Environment(\.dismiss) var dismiss
    @State private var examPicker = ""
    @State private var marks = ""
    @State private var weightage = ""
    @State private var subject = ""
    let exams = ["Math", "Science", "History", "English", "Literature", "Chinese", "Geography"]
    
    var body: some View {
        VStack{
            Form() {
                Picker("Exam", selection: $examPicker) {
                    ForEach(exams, id: \.self) { exam in
                        Text(exam)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                
                TextField("Marks", text: $marks)
                    .keyboardType(.numbersAndPunctuation)
                TextField("Weightage Percentage", text: $weightage)
                    .keyboardType(.numberPad)
                TextField("Subject", text: $subject)
            }
            .navigationTitle("User Form")
            .navigationBarItems(trailing: Button("Done") {
                dismiss()
            })
        }
    }
}


#Preview{
    AddMarksSheetView()
}
