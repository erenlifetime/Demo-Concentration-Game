//
//  Card.swift
//  Concentration
//
//  Created by Eren lifetime on 15.03.2024.
import Foundation
struct Card: Hashable{
    var hashValue: Int { return identifier }
    static func == (lhs: Card,rhs: Card) -> Bool{
        return lhs.identifier == rhs.identifier
    }
    var isMatched = false
    var isFaceUp = false
    private var identifier:Int
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}

