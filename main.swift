//
//  main.swift
//  number guessing game
//
//  Created by Oladayo George on 13/04/2020.
//  Copyright © 2020 Oladayo George. All rights reserved.
//


import Foundation


func rightAnswer() -> (answers: Int, guesses: Int, constantGuess: Int, n: Int) {
//
//    A function to generate a random number between 1 and the maximum permitted number (n)
//    based on the level selected by the player.
//    :return: the right answer (answer), number of guesses allowed (guesses)
//     and the maximum number (n)

    print("These are the available levels!")
    print("Easy: guess a number between 1-10 with 6 guesses")
    print("Medium: Guess a number between 1-20 with 4 guesses")
    print("Hard: Guess a number between 1-50 with 3 guesses \n")
    print("Kindly input the level you want to play [easy, medium, hard]: ")
    let difficulty = ["easy", "medium", "hard"]
    var level = readLine()
    var leverLowercased = level?.lowercased() ?? "Invalid input"
    
    while difficulty.contains(leverLowercased) == false {
        print("Kindly input a valid level selection [easy, medium, hard]: ")
        level = readLine()
        leverLowercased = level?.lowercased() ?? "Invalid input"
    }
    
    if leverLowercased == difficulty[0] {
        let n = 10
        let guesses = 6
        let constantGuess = 10
        let answer = Int.random(in: 1...n)
        return (answer,guesses,constantGuess,n)
    }
    else if leverLowercased == difficulty[1] {
        let n = 20
        let guesses = 4
        let constantGuess = 20
        let answer = Int.random(in: 1...n)
        return (answer,guesses,constantGuess,n)
    }
    else {
        let n = 50
        let guesses = 3
        let constantGuess = 50
        let answer = Int.random(in: 1...n)
        return (answer,guesses,constantGuess,n)
    }
}
    
    func guessingGame() {
        var correct = rightAnswer()
        while correct.guesses > 0 {
            print("you have \(correct.guesses) guesses left")
            print("Kindly input a guess between 1 - \(correct.constantGuess):")
            let input = readLine() ?? "You must enter a number"
            let userInput: Int = Int(input) ?? 1000000
            
            
            if userInput != correct.answers {
                print("Wrong Try Again")
                correct.guesses -= 1
            }

            else {
                print("Right Answer")
                break
            }
            
            while correct.guesses == 1 {
                print("This is your last chance")
                break
            }
        }
          do {
            print("Game Over!!!")
            print("The correct answer is \(correct.answers)")
        }
}
guessingGame()
