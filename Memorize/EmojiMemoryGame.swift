//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Dmitry on 18.07.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static private let emojis = ["🚗", "🚎", "🚜", "✈️", "🚂", "🚁", "🛥", "🚢", "🏎", "🚕", "🚛", "🚑", "🛻", "🛴", "🏍", "🚲"]
    
    @Published private var model:
        MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
