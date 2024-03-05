class Concentration{
  var cards = [Card]()
  var indexofOneAndOnlyFaceUpcard : Int? {
    get{
      var foundIndex : Int?
      for index in cards.indices{
        if cards[index].isFaceUp{
          if foundIndex == nil{
            foundIndex = index
          }else{
            return nil
          }
        }
      }
      return index
    }set{
      for index in cards.indices{
         cards[index].isFaceUp = (index == newValue)
        }
      }
    }
  func chooseCard(at index:Int){
    if !cards[index].isMatched{
      if let matchIndex = indexofOneAndOnlyFaceUpcard , matchIndex != index{
        if cards[matchIndex].identifier == cards[index].identifier{
          cards[matchIndex].isMatched = true
          cards[index].isMatched = true
          indexofOneAndOnlyFaceUpcard = nil
        }
        cards[index].isFaceUp = true
      }else{
        // either no cards or 2 cards are face up (kartları döndürürsün)
          for flipDownIndex in cards.indices{
            cards[flipDownIndex].isFaceUp = false
          }
        cards[index].isFaceUp = true
        indexofOneAndOnlyFaceUpcard = index
        }
      }
    }
  init(cardCiftiSayisi:Int){
    for _ in 1...cardCiftiSayisi{
      cards += (card , card)
    }
  }
}
