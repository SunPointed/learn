//
//  ContentView.swift
//  learn
//
//  Created by 罗秋雨 on 2021/7/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject  var viewModel: EmojiMemoryGame
    
    init() {
        viewModel = EmojiMemoryGame()
    }
    
    var body: some View {
        Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }.padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(110 - 90), clockwise: true).padding(5).opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: min(size.width, size.height) * fontScaleFactor))
            }.cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private let fontScaleFactor: CGFloat = 0.75
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
