//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Inna Soboleva on 1/10/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {

        AspectVGrid(items: viewModel.cards, aspectRatio: (2/3), content: { card in
            cardView(for: card)
        })
            .foregroundColor(.red)
            .font(.largeTitle)
            .padding(.horizontal)
    }
    
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
        CardView(card)
            .padding(4)
            .onTapGesture {
                viewModel.choose(card)}
        }
    }
}


struct CardView: View {
    private let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                    Pie(startingAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                        .padding(DrawingConstants.piePadding)
                        .opacity(DrawingConstants.pieOpacity)
                    Text(card.content)
                        .font(font(in: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
        static let piePadding: CGFloat = 5
        static let pieOpacity: CGFloat = 0.5
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(viewModel: game)
    }
}
