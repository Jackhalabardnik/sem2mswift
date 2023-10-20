//
//  ContentView.swift
//  L4
//
//  Created by Jacek  on 20/10/2023.
//

import SwiftUI

struct MyEmoji {
    var content: String
    var open: Bool
}

func generateEmoji(content: String) -> MyEmoji {
    MyEmoji(content: content, open: false)
}

func generatePairs(pairs: Array<String>) -> Array<MyEmoji> {
    var emojiPairs : Array<MyEmoji> = Array()
    
    for pair in pairs {
        emojiPairs.append(generateEmoji(content: pair))
        emojiPairs.append(generateEmoji(content: pair))
    }
    
    return emojiPairs.shuffled()
}


struct ContentView: View {
    @State private var themeColor = Color.blue
    private var emojisTheme1 = generatePairs(
        pairs: ["😁", "🤣", "😎", "😙"])
    private var emojisTheme2 = generatePairs(
        pairs: ["👍", "👎", "👊", "✊","🤛", "🤜"])
    private var emojisTheme3 = generatePairs(
        pairs: ["🌞", "🌝", "🌛", "🌜","🌚", "🌕", "🌖", "🌗"])

    @State private var emojis = generatePairs(
        pairs: ["😁", "🤣", "😎", "😙"])
    
    let cardColumns = [GridItem(.adaptive(minimum: 70))]
    
    var body: some View {
        Text("Memo").font(.largeTitle)
        ScrollView { cardDisplay }.padding()
        themeDisplay
    }
    
    var cardDisplay: some View {
        LazyVGrid(columns: cardColumns, spacing: 15) {
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(isFaceUp: $emojis[index].open ,content: $emojis[index].content, themeColor: $themeColor).aspectRatio(2/3,contentMode: .fill)
            }
        }.foregroundColor(themeColor)
    }
    
    var themeDisplay: some View {
        HStack {
            TopicButton(icon: "smiley", content: "Motyw 1", buttonAction: {
                changeTheme(newTheme: "Theme 1")
            }, themeColor: $themeColor)
            Spacer()
            TopicButton(icon: "hand.thumbsup", content: "Motyw 2", buttonAction: {
                changeTheme(newTheme: "Theme 2")
            }, themeColor: $themeColor)
            Spacer()
            TopicButton(icon: "sun.max", content: "Motyw 3", buttonAction: {
                changeTheme(newTheme: "Theme 3")
            }, themeColor: $themeColor)
        }
    }
    
    func changeTheme(newTheme: String) {
        switch newTheme {
        case "Theme 1":
            themeColor = .blue
            emojis = emojisTheme1.shuffled()
        case "Theme 2":
            themeColor = .red
            emojis = emojisTheme2.shuffled()
        case "Theme 3":
            themeColor = .green
            emojis = emojisTheme3.shuffled()
        default:
            changeTheme(newTheme: "Theme 1")
        }
    }
}
