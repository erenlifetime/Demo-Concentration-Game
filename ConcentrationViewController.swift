//
//  ViewController.swift
//  Concentration
//
//  Created by Eren lifetime on 15.03.2024.
//
import UIKit
class ConcentrationViewController: UIViewController {
    
    lazy var game: Concentration = Concentration(cardCiftiSayisi: cardCiftiSayisi)
    var cardCiftiSayisi: Int {
        return (cardAllButtons.count+1) / 2
    }
    // Sayaç yapıyoruz ne kadar döndü diye basic bir sayaç
    private (set) var flipCount = 0 {didSet{
            updateFlipCountLabel()
    func updateFlipCountLabel(){
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth : 5.0,
            .strokeColor : UIColor.orange
                ]
        let attributedString = NSAttributedString(
            string: "Flips: \(String(describing: flipCountLabel))",
        attributes: attributes
        )
        
            }
            }
        }
    @IBOutlet weak var flipCountLabel: UILabel! {
        didSet{updateViewFromModel()}
    }
    @IBOutlet var cardAllButtons: [UIButton]!
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardAllButtons.firstIndex(of:sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
// ConcentrationThemeChooseViewController da yaptığım işlemden sonra bana
// unexpectedly found nil while unwrapping an Optional Value
// hata aldıktan sonra çözümü -> if cardAllButtons != nil{
    func updateViewFromModel(){
        if cardAllButtons != nil{
            for index in cardAllButtons.indices{
                let button = cardAllButtons[index]
                let card = game.cards[index]
                if card.isFaceUp{
                    button.setTitle(emoji(for:card), for: UIControl.State.normal)
                    button.backgroundColor = UIColor.green
                }else{
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? UIColor.white : UIColor.orange
                }
            }
        }
    }
    var theme:String?{
        didSet{
//            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
private var emojiChoices = ["🐰","🐭","🐷","🐮","🐴","🦄","🐹","🐸","🐱"]
private var emoji = [Card:String]()
private func emoji(for card:Card) -> String{
    if emoji[card] == nil , emojiChoices.count > 0{
        emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
    }
     return emoji[card] ?? "?"
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
