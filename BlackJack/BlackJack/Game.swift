//
//  Game.swift
//  BlackJack
//
//  Created by Edward O'Neill on 10/24/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

class Game {
    var deck: [Card]
    var player: Player
    var hitPlayer: Bool
    var computerScore = 0
    var hasMoreCards: Bool {
        return true
    }
    var randomComputerScore: Int {
        let scoreList = [18, 19, 20, 21]
        return scoreList.randomElement() ?? 18
    }
    static var contitueInputType: Set<String> = ["quit", "leave", "no", "n"]
    
    init(deck: [Card], player: Player, hitPlayer: Bool) {
        self.deck = deck
        self.player = player
        self.hitPlayer = hitPlayer
    }
    
    func newGame() {
        deck.removeAll()
        deck = Card.newDeck(aceValue: 1)
        player.score = 0
        player.cards.removeAll()
        computerScore = 0
    }
    
    func stopHits() -> Int {
        return self.randomComputerScore
    }
    
    func hitMe() -> Card {
        self.deck = self.deck.shuffled()
        return self.deck.removeLast()
    }
    
    func computerVsPlayer() -> Int {
        return self.stopHits()
    }
    
    func playerScore() {
        for card in self.player.cards {
            switch card.suit {
            case .club:
                print("\(Suit.club.rawValue)\(card.value)", terminator: " ")
            case .spade:
                print("\(Suit.spade.rawValue)\(card.value)", terminator: " ")
            case .dimond:
                print("\(Suit.dimond.rawValue)\(card.value)", terminator: " ")
            case .heart:
                print("\(Suit.heart.rawValue)\(card.value)", terminator: " ")
            }
        }
        
        print("score: \(player.score)")
    }
    
    func gameStatus() {
        if self.player.score > 21 {
            print("Bust...")
            print("Would you like to play again?\n(Yes / No)")
        } else if self.player.score == 21 {
            print("BlackJack!!!!!")
            print("Would you like to play again?\n(Yes / No)")
        } else {
            print("Would you like to hit again?\n(hit / pass)")
        }
    }
    
    func continueGame(userInput: String) -> Bool {
        if Game.contitueInputType.contains(userInput) {
            return false
        } else {
            return true
        }
    }
}
