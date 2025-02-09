//
//  QuizSubmission.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

struct QuizSubmission {
    
    //MARK: - Properties
    let quizId: Int
    private(set) var selectedChoices: [Int: Int] = [:]
    
    //MARK: - Init
    init(quizId: Int) {
        self.quizId = quizId
    }
    
    //MARK: - Public API
    func isSelected(questionId: Int, choiceId: Int) -> Bool {
        if let persistedChoiceId = selectedChoices[questionId] {
            return choiceId == persistedChoiceId
        }
        return false
    }
    
    mutating func addChoice(questionId: Int, choiceId: Int) {
        self.selectedChoices[questionId] = choiceId
    }
}
