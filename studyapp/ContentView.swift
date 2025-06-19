//
//  ContentView.swift
//  studyapp
//
//  Created by James on 17/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isSheetPresented = false
    @State private var isProfileSheetPresented = false
    @AppStorage("userGoal") private var userGoal: Int = 85

    @EnvironmentObject var examData: ExamData // <-- Add this line

    @State private var goals: [Goal] = []

    var leastAttainableGoals: [Goal] {
        goals
            .sorted(by: { (Int($0.currentMarks) - userGoal) < (Int($1.currentMarks) - userGoal) })
            .prefix(3)
            .map { $0 }
    }

    var body: some View {
        NavigationStack {
            VStack {
                AverageMarksChartView(examEntries: examData.exams) // <-- Pass real data here
                    .padding(.bottom)
                
                GoalsView(goals: leastAttainableGoals)

                Button {
                    isSheetPresented = true
                } label: {
                    Image("Add New Marks Button - Light")
                }
                .padding()
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isProfileSheetPresented = true
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .font(.title2)
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $isSheetPresented) {
            AddMarksSheetView()
        }
        .sheet(isPresented: $isProfileSheetPresented) {
            ProfileView()
        }
        .onAppear {
            goals = generateGoals(from: examData.exams, withTargets: [:]) // Add targets if you want
        }
    }
}


#Preview {
    ContentView()
}
