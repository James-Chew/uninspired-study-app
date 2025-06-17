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
                        .keyboardType(.numbersAndPunctuation)
                    
                    TextField("Weightage Percentage", text: $weightage)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("Actions")){
                    Button(){
                        print("Save")
                        // todo: link
                    }label:{
                        Text("Save")
                            .foregroundStyle(.green)
                    }
                    Button(){
                        print("Cancel")
                        dismiss()
                    }label:{
                        Text("Cancel")
                            .foregroundStyle(.red)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddMarksSheetView()
}
