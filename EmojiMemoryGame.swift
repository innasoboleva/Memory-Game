//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Inna Soboleva on 6/6/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis: [String] = ["🚲", "⛽️", "🪙", "🚃", "💶", "🪔", "🛠", "💸", "🎥", "💎", "⏰", "⛓", "🧨", "🪧", "📤", "📥", "💌", "🧸", "🎁", "🪟", "📅", "🗝", "🏧", "🚹", "🚮"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
