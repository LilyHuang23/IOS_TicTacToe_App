//
//  Utils.swift
//  Tic Tac Toe
//
//  Created by Huang Lily on 5/17/23.
//

import Foundation

func checkWinner(list: [String], letter: String) -> Bool {
    let winningCondictions = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6],
        [0, 3, 6], [1, 4, 7], [2, 5, 8]
    ]
    for condiction in winningCondictions{
        var score = 0
        for match in condiction {
            if list[match] == letter {
                score += 1
                
                if score == 3 {
                    return true
                }
            }
        }
    }
    return false
}
