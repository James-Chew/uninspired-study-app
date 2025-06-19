//
//  Goal.swift
//  studyapp
//
//  Created by James on 18/6/25.
//

import Foundation

struct Goal: Identifiable {
    let id = UUID()
    let subject: String
    let goalMarks: Double
    let currentMarks: Double
}
