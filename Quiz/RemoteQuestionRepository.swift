//
//  RemoteQuizRepository.swift
//  Quiz
//
//  Created by Pascal Hurni on 21.03.17.
//  Copyright © 2017 Pascal Hurni. All rights reserved.
//

import Foundation

class RemoteQuestionRepository : QuestionRepository {
    // To enable getting data out of plain HTTP, see this:
    // http://stackoverflow.com/questions/31254725/transport-security-has-blocked-a-cleartext-http
    
    fileprivate let url: String
    
    init(remoteUrl: String) {
        url = remoteUrl
    }

    func fetchQuestion() -> Question {
        let json: NSDictionary = parseJSON(getJSON(url + "/questions/next"))
        
        return Question(
            caption: (json["caption"] as? String)!,
            answers: (json["answers"] as? [String])!,
            correctAnswer: (json["answers"] as? [String])![(json["correct_answer_index"] as? Int)!],
            hint: (json["hint"] as? String)!)
    }


    fileprivate func getJSON(_ urlToRequest: String) -> Data
    {
        return (try! Data(contentsOf: URL(string: urlToRequest)! as URL))
    }
    
    fileprivate func parseJSON(_ inputData: Data) -> NSDictionary{
        let dictData = (try! JSONSerialization.jsonObject(with: inputData, options: [])) as! NSDictionary
        return dictData
    }
    
}
