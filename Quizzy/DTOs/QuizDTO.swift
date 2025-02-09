//
//  QuizDTO.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

struct QuizDTO: Codable {
    
    //MARK: - Properties
    let quizId: Int
    let title: String
    let questions: [QuestionDTO]
}

struct QuestionDTO: Codable {
    
    //MARK: - Properties
    let questionId: Int
    let text: String
    let point: Int
    let choices: [ChoiceDTO]
}

struct ChoiceDTO: Codable {
    
    //MARK: - Properties
    let choiceId: Int
    let text: String
    let isCorrect: Bool
}
