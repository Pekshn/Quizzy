//
//  Question.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

class Question {
    
    //MARK: - Properties
    let questionId: Int
    let text: String
    let point: Int
    let choices: [Choice]
    
    //MARK: - Init
    init(questionDTO: QuestionDTO) {
        self.questionId = questionDTO.questionId
        self.text = questionDTO.text
        self.point = questionDTO.point
        self.choices = questionDTO.choices.map(Choice.init)
    }
}
