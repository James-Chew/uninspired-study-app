//
//  ExamModel.swift
//  studyapp
//
//  Created by James on 17/6/25.
//

import Foundation

struct ExamEntry: Identifiable {
    let id = UUID()
    let subject: String
    let marks: Double
    let weightage: Double
    let exam: String
}
