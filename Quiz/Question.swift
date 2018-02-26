//
//  Question.swift
//  Quiz
//
//  Created by Pascal Hurni on 17.02.16.
//  Copyright (c) 2016 Pascal Hurni. All rights reserved.
//

import Foundation

class Question {
    let caption: String!
    let answers: [String]!
    let hint: String!
    
    fileprivate var correctAnswer: String
    
    init(caption: String, answers: [String], correctAnswer: String, hint: String = "") {
        self.caption = caption
        self.answers = answers
        self.hint = hint
        self.correctAnswer = correctAnswer
    }
    
    func isCorrectAnswer(_ answer: String) -> Bool {
        return answer == correctAnswer
    }
}
