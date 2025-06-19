//
//  TermGraph.swift
//  studyapp
//
//  Created by James on 17/6/25.
//

import SwiftUI
import Charts


struct AverageMarksChartView: View {
    let examEntries: [ExamEntry]
    let goal: Double = 75

    var subjectAverages: [String: Double] {
        Dictionary(grouping: examEntries, by: { $0.subject }).mapValues { entries in
            let totalWeighted = entries.reduce(0) { $0 + $1.marks * $1.weightage }
            let totalWeight = entries.reduce(0) { $0 + $1.weightage }
            return totalWeight == 0 ? 0 : totalWeighted / totalWeight
        }
    }

    var overallAverage: Double {
        let totalWeighted = examEntries.reduce(0) { $0 + $1.marks * $1.weightage }
        let totalWeight = examEntries.reduce(0) { $0 + $1.weightage }
        return totalWeight == 0 ? 0 : totalWeighted / totalWeight
    }

    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 4) {
                Text(String(format: "%.0f", overallAverage))
                    .font(.system(size: 28, weight: .bold))
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.red)
            }

            Text("Average marks for this term")
                .font(.subheadline)

            Chart {
                ForEach(subjectAverages.sorted(by: { $0.key < $1.key }), id: \.key) { subject, avg in
                    BarMark(
                        x: .value("Subject", subject),
                        y: .value("Average", avg)
                    )
                    .foregroundStyle(Color.blue)
                }

                RuleMark(y: .value("Goal", goal))
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                    .foregroundStyle(.white.opacity(0.6))
            }
            .frame(height: 160)
            .chartXAxis {
                AxisMarks { _ in
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel()
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }

            HStack(spacing: 8) {
                Capsule()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: 20, height: 2)
                Text("Your Goal")
                    .font(.caption)
            }
        }
        .padding()
        .frame(width: 358)
        .background(.quaternary)
        .cornerRadius(10)
    }
}


#Preview {
    AverageMarksChartView(examEntries: [
        ExamEntry(subject: "EL", marks: 72, weightage: 1, exam: "Mid-Year"),
        ExamEntry(subject: "Math", marks: 78, weightage: 1, exam: "Mid-Year"),
        ExamEntry(subject: "Hist", marks: 70, weightage: 1, exam: "Mid-Year"),
        ExamEntry(subject: "Sci", marks: 77, weightage: 1, exam: "Mid-Year"),
        ExamEntry(subject: "Geog", marks: 75, weightage: 1, exam: "Mid-Year"),
        ExamEntry(subject: "CL", marks: 72, weightage: 1, exam: "Mid-Year"),
        ExamEntry(subject: "Lit", marks: 79, weightage: 1, exam: "Mid-Year")
    ])
}
