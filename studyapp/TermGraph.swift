//
//  TermGraph.swift
//  studyapp
//
//  Created by James on 17/6/25.
//

import SwiftUI

struct TermGraphView: View {
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Spacer()
                    Text("Hi")
                    Spacer()
                }
            }
            .frame(width: .infinity, height: 300)
            .background(.tertiary)
            .clipShape(.rect(cornerRadius: 10))
        }
        .padding()
    }
}

#Preview {
    TermGraphView()
}
