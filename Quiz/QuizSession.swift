//
//  QuizSession.swift
//  Quiz
//
//  Created by Pascal Hurni on 17.02.16.
//  Copyright (c) 2016 Pascal Hurni. All rights reserved.
//

import Foundation

class QuizSession {
    
    fileprivate var questions: [Question]
    fileprivate var currentIndex: Int
    private var _score: Int
    
    var score: Int {
        get {
            return self._score
        }
    }
    
    var questionCount: Int {
        get {
            return self.questions.count
        }
    }
    
    init() {
        questions = [
            Question(
                caption: "2+2",
                answers: ["1", "2", "4"],
                correctAnswer: "4",
                hint: "Quick math"),
            Question(
                caption: "Meaning of life?",
                answers: ["God", "42", "Me"],
                correctAnswer: "42",
                hint: "*"),
            Question(
                caption: "May the Force be with you",
                answers: ["Star wars", "Forest Gump", "American pie"],
                correctAnswer: "Star wars",
                hint: "Do. Or do not. There is no try.")
        ]
        
        currentIndex = -1
        _score = 0
    }
    
    func nextQuestion() -> Question? {
        if currentIndex+1 >= questions.count {
            return nil
        }
        else {
            currentIndex += 1
            return questions[currentIndex]
        }
    }
    
    func getHint() -> String {
        return questions[currentIndex].hint
    }
    
    func checkAnswer(_ answer: String) -> Bool {
        let result: Bool = questions[currentIndex].isCorrectAnswer(answer)
        if result {
            self._score += 1
        }
        return result
    }
}
