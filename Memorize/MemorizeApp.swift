//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Inna Soboleva on 1/10/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
