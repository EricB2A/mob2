//
//  WarriorQuizSession.swift
//  Quiz
//
//  Created by toufik on 26.02.18.
//  Copyright © 2018 Pascal Hurni. All rights reserved.
//

import Foundation

class NinjaQuizSession : QuizSession {
    var _currentQuestionCount: Int
    var _wasCorrect: Bool
    var _lastQuestion: Question!
    
    init(questionRepository: QuestionRepository){
        _currentQuestionCount = 0
        _wasCorrect = true
        
        super.init(questionRepository: questionRepository, totalQuestionCount: 15)
    }
    
    override func nextQuestion() -> Question? {
        _currentQuestionCount += 1
        if _currentQuestionCount > _totalQuestionCount {
            return nil
        }
        if self._wasCorrect == false {
            return _lastQuestion // returns the same question
        }
        return super.nextQuestion();
    }
    
    override func checkAnswer(_ answer: String) -> Bool {
        let correct = super.checkAnswer(answer)
        self._wasCorrect = correct
        self._lastQuestion = super._currentQuestion
        if correct {
            _score += 1
        } else {
            _score -= 1
        }
        return correct
    }
    
    override func gameTimeEnded(timerValue: Int) -> Bool {
        return timerValue > 50
    }
    
    override func questionTimeEnded(timerValue: Int) -> Bool{
        return timerValue > 3
    }
    
    
}
