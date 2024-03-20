//
//  Concentration.swift
//  Concentration
//
//  Created by Eren lifetime on 15.03.2024.
//
import UIKit
class Concentration{
    private (set) var cards = [Card]()
    var cardsAll = [Card]()
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            return cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly
        }set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    func chooseCard(at index: Int){
       assert(cards.indices.contains(index)," Concentration.chooseCard(at: \(index)): choosen index not in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(cardCiftiSayisi:Int){
        assert(cardCiftiSayisi > 0,"Concentration.init \(cardCiftiSayisi)) : you must have least one pair of cards")
        for _ in 1...cardCiftiSayisi{
            let card = Card()
            cards += [card, card]
        }
        // ToDo : Shuffle the cards
    }
}
extension Collection{
    var oneAndOnly : Element?{
        return count == 1 ? first : nil
        }

    }
