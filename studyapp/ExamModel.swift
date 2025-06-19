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

func generateGoals(from examEntries: [ExamEntry], withTargets targets: [String: Double]) -> [Goal] {
    let subjectGroups = Dictionary(grouping: examEntries, by: { $0.subject })
    return subjectGroups.compactMap { (subject, entries) -> Goal? in
        let total = entries.reduce(0) { $0 + $1.marks * $1.weightage }
        let weight = entries.reduce(0) { $0 + $1.weightage }
        guard let target = targets[subject], weight > 0 else { return nil }
        let avg = total / weight
        return Goal(subject: subject, goalMarks: target, currentMarks: avg)
    }
}
