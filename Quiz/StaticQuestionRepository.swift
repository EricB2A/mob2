//
//  StaticQuestionRepository.swift
//  Quiz
//
//  Created by Pascal Hurni on 14.02.17.
//  Copyright © 2017 Pascal Hurni. All rights reserved.
//

import Foundation

class StaticQuestionRepository : QuestionRepository {
    var _questions: [Question]
    
    init() {
        _questions = [
            Question(
                caption: "2+2",
                answers: ["1", "2", "4"],
                correctAnswer: "4",
                hint: "come on"
            ),
            Question(
                caption: "Meaning of life?",
                answers: ["God", "42", "Me"],
                correctAnswer: "42",
                hint: "H2G2"
            ),
            Question(
                caption: "May the Force be with you",
                answers: ["Star wars", "Forest Gump", "American pie"],
                correctAnswer: "Star wars",
                hint: "Skywalker"
            )
        ]
    }
    
    func fetchQuestion() -> Question {
        return _questions[Int(arc4random_uniform(UInt32(_questions.count)))]
    }
}
