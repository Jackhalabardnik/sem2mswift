//
//  TopicButton.swift
//  L4
//
//  Created by Jacek  on 20/10/2023.
//

import SwiftUI

struct TopicButton: View {
    @State var icon: String
    @State var content: String
    @State var buttonAction: () -> Void
    @Binding var themeColor: Color
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                VStack {
                    Image(systemName: icon)
                    Text(content).font(.body)
                }
            }
        }.padding()
            .foregroundColor(themeColor)
    }
}

