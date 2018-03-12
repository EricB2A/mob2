//
//  ViewController.swift
//  Quiz
//
//  Created by Pascal Hurni on 17.02.16.
//  Copyright (c) 2016 Pascal Hurni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var hintButton: UIButton!
    @IBOutlet var hintLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerButton1: UIButton!
    @IBOutlet var answerButton2: UIButton!
    @IBOutlet var answerButton3: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    var session : QuizSession!
    var globalCounter = 0
    var questionCounter = 0
    var timer = Timer();
    var gameMode = "SimpleQuizSession"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("GAME MODE IS ")
        print(gameMode)
        
        // Create our game session, and get the first question
        session = NinjaQuizSession(questionRepository: RemoteQuestionRepository(remoteUrl: "http://localhost:4567"))
        nextOne()
        
        // Starts timer
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    func timerAction() {
        globalCounter += 1
        questionCounter += 1
        timerLabel.text = "\(questionCounter)" // Update timer label
        
        if session.gameTimeEnded(timerValue: globalCounter) { // No more time !
            endGame()
        }
        
        if session.questionTimeEnded(timerValue: questionCounter){
            nextQuestion(question: session.nextQuestion()!)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answerClick(_ sender: UIButton) {
        // Tell the session the chosen answer
        session.checkAnswer(sender.currentTitle!)
        
        // Pass to the next question
        nextOne()
    }

    func nextOne() {
        hintLabel.isHidden = true
        hintButton.isHidden = false

        // get the next question from the session
        if let question = session.nextQuestion() {
            // Set the captions
            nextQuestion(question: question)
        }
        else {
            // No more questions! This is the end
            endGame();
        }
    }
    
    func nextQuestion(question: Question){
        questionCounter = 0
        questionLabel.text = question.caption
        hintLabel.text = question.hint
        answerButton1.setTitle(question.answers[0], for: UIControlState())
        answerButton2.setTitle(question.answers[1], for: UIControlState())
        answerButton3.setTitle(question.answers[2], for: UIControlState())
    }
    
    func endGame(){
        answerButton1.isHidden = true
        answerButton2.isHidden = true
        answerButton3.isHidden = true
        hintLabel.isHidden = true
        hintButton.isHidden = true
        timerLabel.isHidden = true
        questionLabel.text = "GAME OVER\nyour score: \(session.score) / \(session.questionsCount)"
        timer.invalidate()
    }
    
    @IBAction func hintClick(_ sender: UIButton) {
        hintLabel.isHidden = false
        hintButton.isHidden = true
    }
    
}

