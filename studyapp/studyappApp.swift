//
//  studyappApp.swift
//  studyapp
//
//  Created by James on 17/6/25.
//

import SwiftUI

@main
struct studyappApp: App {
    @StateObject private var examData = ExamData()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(examData)
        }
    }
}

#Preview{
    MainTabView()

}
