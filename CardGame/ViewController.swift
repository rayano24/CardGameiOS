//
//  ViewController.swift
//  CardGame
//
//  Created by Rayan Osseiran on 2019-09-07.
//  Copyright © 2019 RayLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftCard: UIImageView!
    
    @IBOutlet weak var rightCard: UIImageView!
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    
    @IBOutlet weak var computerScoreLabel: UILabel!
    
    var playerScore = 0
    var computerScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dealClicked(_ sender: Any) {
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        
        leftCard.image = UIImage(named: "card\(leftNumber)")
        rightCard.image = UIImage(named: "card\(rightNumber)")
        
        if (leftNumber > rightNumber) {
            playerScore += 1
            playerScoreLabel.text = String(playerScore)
        }
        else if(rightNumber > leftNumber) {
            computerScore += 1
            computerScoreLabel.text = String(computerScore)
        }
        
        if(playerScore == 10) {
            displayAlert(title: "You win!", message : "AI's got nothing on ya")
        }
        else if (computerScore == 10) {
            displayAlert(title: "You lose!", message : "Better luck next time!")
        }
        
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartGame()}))
        self.present(alert, animated: true)
    }
    
    func restartGame() {
        playerScore = 0
        computerScore = 0
        playerScoreLabel.text = "0"
        computerScoreLabel.text = "0"
    }
    
}

