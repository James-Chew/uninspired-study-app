//
//  ContentView.swift
//  studyapp
//
//  Created by James on 17/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isSheetPresented = false
    var body: some View {
        NavigationStack{
            VStack {
                TermGraphView()
                GoalsView()
                Button{
                    print("Button Clicked")
                    isSheetPresented = true
                }
            label:
                {
                    Image("Add New Marks Button - Light")
                }
                .padding()
                
            }
            .navigationTitle("Home")
            .padding()
            
        }
        .sheet(isPresented: $isSheetPresented) {
            AddMarksSheetView()
        }
    }
}

#Preview {
    ContentView()
}
