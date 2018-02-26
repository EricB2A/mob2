//
//  QuestionRepository.swift
//  Quiz
//
//  Created by Pascal Hurni on 14.02.17.
//  Copyright © 2017 Pascal Hurni. All rights reserved.
//

import Foundation

protocol QuestionRepository {
    func fetchQuestion() -> Question
}
