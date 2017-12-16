//
//  ViewController.swift
//  Concentration
//
//  Created by Luis Godinez on 11/20/17.
//  Copyright © 2017 Luis Godinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)

    private var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1)/2
    }
    private var flipCount: Int = 0{
        didSet {//property observer
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1

        if let cardNumber = cardButtons.index(of: sender) {
           // flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            print(cardNumber)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("chosen card was not in cardButtons")
        }
    }
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["👻","🎃", "🦇", "🤡","🦕", "🛸"]
    
    //var emoji = Dictionary<Int, String>()
    private var emoji = [Int:String]()
    
    private func emoji(for card:Card) -> String {
       // let chosenEmoji = emoji[card.identifier]
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        }else{
//         return "?"
//        }
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            //let randomIndex =  Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    }

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else {
            return 0
        }
    }

//    func flipCard(withEmoji emoji: String, on button: UIButton){
//        if button.currentTitle == emoji {
//            button.setTitle("", for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//        }else {
//            button.setTitle(emoji, for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        }
//    }
}

