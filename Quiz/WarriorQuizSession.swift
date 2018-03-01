//
//  WarriorQuizSession.swift
//  Quiz
//
//  Created by toufik on 26.02.18.
//  Copyright © 2018 Pascal Hurni. All rights reserved.
//

import Foundation

class WarriorQuizSession : QuizSession {
    var _currentQuestionCount: Int
    var _wasCorrect: Bool
    var _lastQuestion: Question!
    var timer: Timer
    
    init(questionRepository: QuestionRepository){
        _currentQuestionCount = 0
        _wasCorrect = true
        timer = Timer.scheduledTimer(TimeInterval: 1, repeats: true, target: self, selector: #selector(self.update))
        
        super.init(questionRepository: questionRepository, totalQuestionCount: 15)
    }
    
    override func nextQuestion() -> Question? {
        print("timer tamer");
        print(timer.timeInterval)
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
}
