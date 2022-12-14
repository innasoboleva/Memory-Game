//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Inna Soboleva on 6/6/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis: [String] = ["๐ฒ", "โฝ๏ธ", "๐ช", "๐", "๐ถ", "๐ช", "๐ ", "๐ธ", "๐ฅ", "๐", "โฐ", "โ", "๐งจ", "๐ชง", "๐ค", "๐ฅ", "๐", "๐งธ", "๐", "๐ช", "๐", "๐", "๐ง", "๐น", "๐ฎ"]
    
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
