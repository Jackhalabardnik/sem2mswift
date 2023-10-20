//
//  CardView.swift
//  L4
//
//  Created by Jacek  on 20/10/2023.
//

import SwiftUI

struct CardView: View {
    @State private var isFaceUp = false
    @State var content: String
    @Binding var themeColor: Color
    
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .foregroundColor(themeColor)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
