struct Card{
  var isFaceUp = false
  var isMatched = false
  var identifier:Int
  static var identifierFactory = 0
  static func allFactory()->Int{
    identifierFactory += 1
    return identifierFactory
  }
  init(){
    self.identifier = Card.allFactory
  }
  }
}
