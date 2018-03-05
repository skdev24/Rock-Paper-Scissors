//
//  ResultViewController.swift
//  RockPaper
//
//  Created by Shivam Dev on 05/03/18.
//  Copyright © 2018 Shivam Dev. All rights reserved.
//

import UIKit

struct score {
    var opponentValue = ""
}

class ResultViewController: UIViewController {

    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var redTeam: UILabel!
    @IBOutlet weak var greenTeam: UILabel!
    
    var opponetValue: String = ""
    var userChoice = ["Rock","Paper","Scissor"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findResult()
        
        // Do any additional setup after loading the view.
    }
    func display(name: String, forPaper: String = "") {
        if forPaper == "Paper" {
            opponetValue = forPaper
        } else {
            opponetValue = name
        }
        
    }
    
    func findResult() {

        let random = Int(arc4random_uniform(UInt32(3)))
        let userValue = userChoice[random]
        
        redTeam.text = "\(opponetValue)"
        greenTeam.text = "\(userValue)"
    
        if opponetValue == userValue {
            scoreLbl.text = "Its a Tie"
            image.image = #imageLiteral(resourceName: "itsATie")
        } else if ((opponetValue == "Rock") && (userValue == "Paper")) || ((opponetValue == "Paper") && (userValue == "Rock")) {
            if opponetValue == "Paper" {
                scoreLbl.text = "RED WINS! HE COVERED YOU!!!"
            } else {
                scoreLbl.text = "GREEN WINS! HE COVERED YOU!!!"
            }
            image.image = #imageLiteral(resourceName: "PaperCoversRock")
        } else if ((opponetValue == "Rock") && (userValue == "Scissor")) || ((opponetValue == "Scissor") && (userValue == "Rock")) {
            if opponetValue == "Rock" {
                scoreLbl.text = "RED WINS! HE DESTROYED YOU!!!"
            } else {
                scoreLbl.text = "GREEN WINS! HE DESTROYED YOU!!!"
            }
            image.image = #imageLiteral(resourceName: "RockCrushesScissors")
        } else if ((opponetValue == "Paper") && (userValue == "Scissor")) || ((opponetValue == "Scissor") && (userValue == "Paper")) {
            if opponetValue == "Scissor" {
                scoreLbl.text = "RED WINS! HE DESTROYED YOU!!!"
            } else {
                scoreLbl.text = "GREEN WINS! HE DESTROYED YOU!!!"
            }
            image.image = #imageLiteral(resourceName: "ScissorsCutPaper")
        }
        
    }
    
    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegue", sender: self)
        opponetValue = ""
    }
    
}
