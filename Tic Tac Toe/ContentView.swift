//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by Huang Lily on 5/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["","","","","","","","",""]
    @State private var endGameText = "Tic Tac Toe"
    @State private var gameEndend = false
    private var ranges = [(0..<3),(3..<6),(6..<9)]
    var body: some View {
        VStack {
            Text(endGameText)
                .alert(endGameText, isPresented: $gameEndend) {
                    Button("Reset", role: .destructive, action: resetGame)
                }
//            Create board
            Spacer()
            ForEach(ranges, id: \.self) { range in
                HStack {
                    ForEach(range, id: \.self) {i in
                        XOButton(letter: $moves[i])
                            .simultaneousGesture(
                                TapGesture().onEnded { _ in
                                    playerTap(index: i)
                                }
                            
                        )
                    }
                }
            }
            Spacer()
            Button("Reset", action:resetGame)
        }
    }
    func playerTap(index: Int) {
        if moves[index] == "" {
            moves[index] = "X"
            botMove()
        }
//        check if player/ bot win
        for letter in ["X", "O"] {
            if checkWinner(list: moves, letter: letter) {
                endGameText = "\(letter) win!"
                gameEndend = true
                break
            }
        }
    }
//    AI O player   
    func botMove(){
        var availableMoves: [Int] = []
        var moveLeft = 0
        
        for move in moves {
            if move == "" {
                availableMoves.append(moveLeft)
            }
            moveLeft += 1
        }
        if availableMoves.count != 0 {
            moves[availableMoves.randomElement()!] = "O"
    }
   
    }
    func resetGame(){
        endGameText = "Tic Tac Toe"
        moves = ["","","","","","","","",""]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
