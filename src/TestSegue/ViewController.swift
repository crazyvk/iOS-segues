//
//  ViewController.swift
//  TestSegue
//
//  Created by gauravds on 25/01/17.
//  Copyright © 2017 Punchh Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        board = [[1,0,0], [0,1,0], [0,0,1]]
        checkStatus()
        
        board = [[2,2,2], [0,0,0], [0,0,1]]
        checkStatus()
    }

    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
    // default position = 0
    // assume x is first with value 1
    // assume o is second with value 2
    var board = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
    
    let winningBoard = [
        [[1,1,1],[0,0,0],[0,0,0]],
        [[0,0,0],[1,1,1],[0,0,0]],
        [[0,0,0],[0,0,0],[1,1,1]],
        
        [[1,0,0],[1,0,0], [1,0,0]],
        [[0,1,0],[0,1,0], [0,1,0]],
        [[0,0,1],[0,0,1], [0,0,1]],
        
        [[1,0,0],[0,1,0], [0,0,1]],
        [[0,0,1],[0,1,0], [1,0,0]],
        ]
    
    func checkStatus() {
        if checkForWinner(val: 1) { // x
            print("x wins")
        } else if checkForWinner(val: 2) { // 0
            print("0 wins")
        } else {
            var xCount = 0, oCount = 0, dotCount = 0
            for i in 0..<3 {
                for j in 0..<3 {
                    switch board[i][j] {
                    case 1: // x
                        xCount += 1
                    case 2: // 0
                        oCount += 1
                    default:
                        dotCount += 1
                    }
                }
            }
            
            if dotCount == 0 {
                print("match draw")
            } else if xCount > oCount {
                print("o turn")
            } else {
                print("x turn")
            }
        }
    }
    
    
    func checkForWinner(val: Int) -> Bool {
        var counter = 0
        for wBoard in winningBoard {
            counter = 0
            for i in 0..<3 {
                for j in 0..<3 {
                    if wBoard[i][j] == 1 {
                        if board[i][j] == val {
                            counter += 1
                        }
                    }
                }
            }
            if (counter == 3) {
                return true
            }
        }
        return false
    }



    
}

