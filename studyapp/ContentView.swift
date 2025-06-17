//
//  ContentView.swift
//  studyapp
//
//  Created by James on 17/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                TermGraphView()
                GoalsView()
                Spacer()
            }
            .navigationTitle("Home")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
