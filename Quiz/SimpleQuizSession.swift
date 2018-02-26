//
//  RookieQuizSession.swift
//  Quiz
//
//  Created by Pascal Hurni on 14.02.17.
//  Copyright © 2017 Pascal Hurni. All rights reserved.
//

import Foundation

class SimpleQuizSession : QuizSession {
    var _currentQuestionCount: Int
    
    init(questionRepository: QuestionRepository) {
        _currentQuestionCount = 0
        super.init(questionRepository: questionRepository, totalQuestionCount: 10)
    }
    
    override func nextQuestion() -> Question? {
        _currentQuestionCount += 1
        if _currentQuestionCount > _totalQuestionCount {
            return nil
        }
        
        return super.nextQuestion()
    }
    
    override func checkAnswer(_ answer: String) -> Bool {
        let correct = super.checkAnswer(answer)
        if correct { _score += 1 }
        return correct
    }
    
}
