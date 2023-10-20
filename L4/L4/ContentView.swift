//
//  ContentView.swift
//  L4
//
//  Created by Jacek  on 20/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var cardCount = 8
    @State private var themeColor = Color.blue
    private var emojisTheme1 = Array(
        repeating: ["😁", "🤣", "😎", "😙"], count: 2)
        .flatMap{$0}.shuffled()
    private var emojisTheme2 = Array(
        repeating: ["👍", "👎", "👊", "✊","🤛", "🤜", "👌", "👉"], count: 2)
        .flatMap{$0}.shuffled()
    private var emojisTheme3 = Array(
        repeating: ["🌞", "🌝", "🌛", "🌜","🌚", "🌕", "🌖", "🌗","🌘", "🌑", "🌒", "🌓"], count: 2)
        .flatMap{$0}.shuffled()

    private var emojis = Array(repeating: ["😁", "🤣", "😎", "😙"], count: 4).flatMap{$0}.shuffled()
    
    let cardColumns = [GridItem(.adaptive(minimum: 70))]
    
    var body: some View {
        Text("Memo").font(.largeTitle)
        ScrollView { cardDisplay }.padding()
        HStack {
            TopicButton(icon: "smiley", content: "Motyw 1", buttonAction: {
                themeColor = .blue
            }, themeColor: $themeColor)
            Spacer()
            TopicButton(icon: "hand.thumbsup", content: "Motyw 2", buttonAction: {
                themeColor = .red
            }, themeColor: $themeColor)
            Spacer()
            TopicButton(icon: "sun.max", content: "Motyw 3", buttonAction: {
                themeColor = .green
            }, themeColor: $themeColor)
        }
    }
    
    var cardDisplay: some View {
        LazyVGrid(columns: cardColumns, spacing: 15) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index], themeColor: $themeColor).aspectRatio(2/3,contentMode: .fill)
            }
        }.foregroundColor(themeColor)
            
    }
}
