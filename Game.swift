//
//  Game.swift
//  Apple pie
//
//  Created by Dias Ussenov on 30.01.2022.
//

import Foundation

struct Game {
    var word: String
    var remainingMoves: Int
    var guessedLetters: [Character]
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }

    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            remainingMoves -= 1
        }
    }
}
