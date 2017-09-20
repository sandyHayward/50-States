//
//  ViewController.swift
//  Portfolio_UsingStackViewsAutoLayoutAspectRatioUIAlertController
//
//  Created by anthony on 9/1/17.
//  Copyright © 2017 Casandra Hayward. All rights reserved.
//

import UIKit
import GameKit

class StateViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var states = [String]()
    var score = 0
    var correctAnswerStoredInButton = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        states += ["arkansas", "maine", "new york", "louisiana", "mississippi", "rhode island", "california", "texas"]
        
        askQuestion(action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
         
    }
//MARK: Helper Methods
    
    func askQuestion(action: UIAlertAction!) {
    
    //pick three random numbers then use number as index for button or
    //shuffle array then choose first three states
    
    states = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: states) as! [String]
    
   
        button1.setImage(UIImage(named: states[0]), for: .normal)
        button2.setImage(UIImage(named:states[1]), for: .normal)
        button3.setImage(UIImage(named:states[2]), for: .normal)
        
        correctAnswerStoredInButton = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = states[correctAnswerStoredInButton].uppercased()
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswerStoredInButton {
            title = "Correct"
            score += 1
        
        } else {
            title = " Wrong"
            score -= 1
        }
let message = "Your score is \(score)"
        let scoreAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        scoreAlertController.addAction(UIAlertAction(title:"Next State", style: .default, handler: askQuestion))
        present(scoreAlertController, animated: true)
}
}

