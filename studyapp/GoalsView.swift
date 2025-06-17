//
//  GoalsView.swift
//  studyapp
//
//  Created by James on 17/6/25.
//

import SwiftUI

struct GoalsView: View {
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Goals")
                        .padding()
                        .font(.title2)
                    Spacer()
                    
                }
                Text("fvjewvoeagjiajgpfoqjjfw")
                Spacer()
            }
            .frame(width: 358, height: 200)
            .background(.tertiary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

#Preview{
    GoalsView()
}
