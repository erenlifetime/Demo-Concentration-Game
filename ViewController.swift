//
//  ViewController.swift
//  Concentration
//
//  Created by Eren lifetime on 3.03.2024.
//
import UIKit
import Foundation
class ViewController: UIViewController {
    lazy var game: Concentration = Concentration(cardCiftiSayisi: cardCiftiSayisi)
    
    var cardCiftiSayisi: Int {
        return (cardAllButtons.count+1) / 2
    }
    var flipCount = 0{
        didSet{
            flipCountLabel.text = ("Flips: \(flipCount)")
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardAllButtons: [UIButton]!
    @IBAction func touchCard(_ sender: UIButton) {
         flipCount += 1
        if let cardNumber = cardAllButtons.firstIndex(of:sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        }else{
    print("Chosen card was not in cardAllButtons")
        }
    }
    func updateViewFromModel(){
        for index in cardAllButtons.indices{
            let button = cardAllButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.orange : UIColor.orange
            }
        }
    }
private var emojiChoices = ["🐰","🐭","🐷","🐮","🐴","🦄","🐹","🐸","🐱"]
private var emoji = [Int:String]()
private func emoji(for card:Card) -> String{
    if emoji[card.identifier] == nil , emojiChoices.count > 0{
        emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
    }
     return emoji[card.identifier] ?? "?"
    }
}
extension Int {
    var arc4random: Int{
        if self > 0 {
            return Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
    }
}
