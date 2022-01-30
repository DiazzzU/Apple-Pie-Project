//
//  ViewController.swift
//  Apple pie
//
//  Created by Dias Ussenov on 26.01.2022.
//

import UIKit

class ViewController: UIViewController {

    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)
        let letter = Character(letterString!.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    var currentGame: Game!
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, remainingMoves: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        correctWordLabel.text = letters.joined(separator: " ")
        scoreLabel.text = "Wins: \(totalWins), Loses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.remainingMoves)")
    }
    
    func updateGameState() {
      if currentGame.remainingMoves == 0 {
        totalLosses += 1
      } else if currentGame.word == currentGame.formattedWord {
        totalWins += 1
      } else {
        updateUI()
      }
    }
    
    func enableLetterButtons(_ enable: Bool) {
      for button in letterButtons {
        button.isEnabled = enable
      }
    }
}

