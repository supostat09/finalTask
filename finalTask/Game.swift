//
//  Game.swift
//  finalTask
//
//  Created by Абдулла-Бек on 28/2/23.
//

import Foundation

protocol Menu {
    func startGame()
    func endGame()
}

class Game: Menu {
    var board: [[String]] = Array(repeating: Array(repeating: "-", count: 3), count: 3)
    var player: String = "X"
    var moves: Int = 0
    
    func startGame() {
        print("Добро пожаловать в крестики-нолики!")
        printBoard()
        while(!isGameOver()) {
            makeMove()
        }
    }
    
    func endGame() {
        print("Game Over")
    }
    func printBoard() {
        for row in board {
            print(row)
        }
    }
    
    func makeMove() {
        print("\(player) очередь")
        print("Вводите строку:")
        let row = Int(readLine()!)! - 1
        print("Введите столбец:")
        let col = Int(readLine()!)! - 1
        
        if (board[row][col] == "-") {
            board[row][col] = player
            moves += 1
            printBoard()
            if (playerWins()) {
                print("\(player) выигрывет!")
            } else if (moves == 9) {
                print("Ничья")
            } else {
                player = player == "X" ? "O" : "X"
            }
        } else {
            print("Неверный ход. Попробуйте еще раз.")
        }
    }
    
    func isGameOver() -> Bool {
        return playerWins() || moves == 9
    }
    
    func playerWins() -> Bool {
        for row in board {
            if (row == ["X", "X", "X"] || row == ["O", "O", "O"]) {
                return true
            }
        }
        
        for i in 0..<board.count {
            if (board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] != "-") {
                return true
            }
        }
        
        if (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != "-") {
            return true
        }
        if (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != "-") {
            return true
        }
        return false
    }
}
