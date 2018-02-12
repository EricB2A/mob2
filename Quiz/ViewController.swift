//
//  ViewController.swift
//  Quiz
//
//  Created by Pascal Hurni on 17.02.16.
//  Copyright (c) 2016 Pascal Hurni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerButton1: UIButton!
    @IBOutlet var answerButton2: UIButton!
    @IBOutlet var answerButton3: UIButton!
    @IBOutlet var newGameButton: UIButton!
    @IBOutlet weak var hintButton: UIButton!
    @IBOutlet weak var hintLabel: UILabel!
    
    var session : QuizSession!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create our game session, and get the first question
        session = QuizSession()
        nextOne()
        hintLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func callHint(_ sender: Any) {
        hintLabel.isHidden = false
        hintLabel.text = "Hint : " + session.getHint()
    }
    
    @IBAction func answerClick(_ sender: UIButton) {
        // Tell the session the chosen answer
        session.checkAnswer(sender.currentTitle!)
        
        // Pass to the next question
        nextOne()
    }

    @IBAction func newGameClick(_ sender: UIButton) {
        session = QuizSession()
        nextOne()
        
        answerButton1.isHidden = false
        answerButton2.isHidden = false
        answerButton3.isHidden = false
        newGameButton.isHidden = true
    }
    
    func nextOne() {
        hintLabel.isHidden = true
        // get the next question from the session
        if let question = session.nextQuestion() {
            // Set the captions
            questionLabel.text = question.caption
            answerButton1.setTitle(question.answers[0], for: UIControlState())
            answerButton2.setTitle(question.answers[1], for: UIControlState())
            answerButton3.setTitle(question.answers[2], for: UIControlState())
        }
        else {
            // No more questions! This is the end
            answerButton1.isHidden = true
            answerButton2.isHidden = true
            answerButton3.isHidden = true
            
            answerButton1.setTitle("", for: UIControlState())
            answerButton2.setTitle("", for: UIControlState())
            answerButton3.setTitle("", for: UIControlState())
            
            // show new game button
            newGameButton.isHidden = false
            
            questionLabel.text = "You scored : \(session.score) out of \(session.questionCount) questions"
        }
    }
    
}

