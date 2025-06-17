//
//  ExamList.swift
//  studyapp
//
//  Created by James on 17/6/25.
//
import SwiftUI

enum SortOption: String, CaseIterable, Identifiable {
    case exam = "Exam Name"
    case subject = "Subject"
    case marksDescending = "Marks ↓"
    case marksAscending = "Marks ↑"
    
    var id: String { self.rawValue }
}

struct ExamListView: View {
    @EnvironmentObject var examData: ExamData
    @State private var selectedSort: SortOption = .exam
    
    var sortedExams: [ExamEntry] {
        switch selectedSort {
        case .exam:
            return examData.exams.sorted { $0.exam < $1.exam }
        case .subject:
            return examData.exams.sorted { $0.subject < $1.subject }
        case .marksDescending:
            return examData.exams.sorted { $0.marks > $1.marks }
        case .marksAscending:
            return examData.exams.sorted { $0.marks < $1.marks }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Sort Picker
                Picker("Sort by", selection: $selectedSort) {
                    ForEach(SortOption.allCases) { option in
                        Text(option.rawValue).tag(option)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List {
                    ForEach(sortedExams) { exam in
                        VStack(alignment: .leading) {
                            Text("\(exam.subject) — \(exam.exam)")
                                .font(.headline)
                            HStack {
                                Text("Marks: \(exam.marks, specifier: "%.1f")")
                                Spacer()
                                Text("Weightage: \(exam.weightage, specifier: "%.1f")%")
                            }
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("Your Exams")
        }
    }
}
