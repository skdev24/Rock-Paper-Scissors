//
//  ViewController.swift
//  RockPaper
//
//  Created by Shivam Dev on 05/03/18.
//  Copyright © 2018 Shivam Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var value = ""
    var value2 = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func rock(_ sender: Any) {
        let controller: ResultViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        // Set the two values to random numbers from 1 to 6
        controller.display(name: "Rock")
        
        // Present the view Controller
        present(controller, animated: true, completion: nil)
    }

    @IBAction func paper(_ sender: UIButton) {
        value2 = "Paper"
        performSegue(withIdentifier: "play", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            value = "Scissor"
            let vc = segue.destination as! ResultViewController
            vc.display(name: value, forPaper: value2)
        }
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
    
}

