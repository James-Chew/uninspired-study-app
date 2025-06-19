import SwiftUI


struct GoalsView: View {
    let goals: [Goal]

    var body: some View {
        VStack {
            if goals.isEmpty {
                Spacer()
                Text("No goals yet.")
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                ForEach(goals) { goal in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(goal.subject)
                                .font(.headline)

                            Text("Current: \(String(format: "%.1f", goal.currentMarks))% | Target: \(String(format: "%.1f", goal.goalMarks))%")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Text("Gap: \(String(format: "%.1f", goal.goalMarks - goal.currentMarks))%")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
            }

            Spacer()
        }
        .padding()
        .frame(width: 358)
        .background(.quaternary)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
    }
}

#Preview {
    let sampleExams = [
        ExamEntry(subject: "Math", marks: 65, weightage: 1, exam: "MYE"),
        ExamEntry(subject: "Math", marks: 75, weightage: 2, exam: "EYE"),
        ExamEntry(subject: "Science", marks: 70, weightage: 1, exam: "MYE"),
        ExamEntry(subject: "Science", marks: 80, weightage: 1, exam: "EYE"),
        ExamEntry(subject: "English", marks: 82, weightage: 1, exam: "EYE")
    ]

    let targetMarks: [String: Double] = [
        "Math": 80,
        "Science": 85,
        "English": 90
    ]

    let computedGoals = generateGoals(from: sampleExams, withTargets: targetMarks)

    return GoalsView(goals: computedGoals)
}


