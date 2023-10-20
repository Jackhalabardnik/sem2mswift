//
//  ContentView.swift
//  Memory
//
//  Created by Jacek  on 10/10/2023.
//

import SwiftUI

struct AdjusterButton: View {
    let content: String
    @Binding var buttonDisabled: Bool
    @State var action: () -> ()
    
    var body: some View {
        Button(content) { action() }
        .disabled(buttonDisabled)
        .font(.largeTitle)
        .foregroundColor(buttonDisabled ? Color.gray : Color.blue)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(buttonDisabled ? Color.gray : Color.blue, lineWidth: 2)
                .frame(width: 60, height: 40).padding()
        )
        .padding()
    }
}
struct ContentView: View {
    @State private var cardCount = 2
    private var emojis = Array(repeating: ["😁", "🤣", "😎", "😙"], count: 4).flatMap{$0}
    let cardColumns = [GridItem(.adaptive(minimum: 120))]
    let buttonColumns = [GridItem(.fixed(60)), GridItem(.fixed(60))]
    
    func adjustCardNumber(by offset: Int, symbol: String) {
        switch symbol {
        case "+":
            cardCount += offset
        case "-":
            cardCount -= offset
        default:
            break
        }
    }
    
    var body: some View {
        ScrollView { cardDisplay }.padding()
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }.padding()
    }
    
    var cardDisplay: some View {
        LazyVGrid(columns: cardColumns, spacing: 15) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }.foregroundColor(Color.blue)
    }
    
    var cardRemover: some View {
        let removeCards: () -> () = { adjustCardNumber(by: 2, symbol: "-") }
        @State var isDisabled = cardCount == 2
        return AdjusterButton(
            content: "-",
            buttonDisabled: $isDisabled,
            action: removeCards
        )
    }
    
    var cardAdder: some View {
        let addCards: () -> () = { adjustCardNumber(by: 2, symbol: "+") }
        @State var isDisabled = cardCount == emojis.count
        return AdjusterButton(
            content: "+",
            buttonDisabled: $isDisabled,
            action: addCards
        )
    }
}
