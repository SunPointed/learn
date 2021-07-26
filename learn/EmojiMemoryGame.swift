//
//  EmojiMemoryGame.swift
//  learn
//
//  Created by 罗秋雨 on 2021/7/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        var emojis: Array<String> = ["👻", "🥰","😘"]
        emojis.shuffle()
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in emojis[pairIndex]}
    }
        
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
//        objectWillChange.send()
    }
}
