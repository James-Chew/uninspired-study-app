//
//  MainTabView.swift
//  studyapp
//
//  Created by James on 17/6/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            TermGraphView()
                .tabItem {
                    Label("Previous Exams", systemImage: "book.pages.fill")
                }
        }
    }
}
