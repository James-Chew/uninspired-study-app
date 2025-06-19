//
//  ProfileView.swift
//  studyapp
//
//  Created by James on 18/6/25.
//
import SwiftUI

struct ProfileView: View {
    @AppStorage("userGoal") private var userGoal: Int = 85

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Goal Settings")) {
                    VStack(alignment: .leading) {
                        Text("Target Mark: \(userGoal)%")
                            .font(.headline)
                            .padding(.top)

                        Slider(
                            value: Binding(
                                get: { Double(userGoal) },
                                set: { userGoal = Int($0) }
                            ),
                            in: 0...100,
                            step: 1
                        )
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
