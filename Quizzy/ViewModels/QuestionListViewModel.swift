//
//  QuestionListViewModel.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

struct QuestionViewModel: Identifiable {
    
    //MARK: - Properties
    private let question: QuestionDTO
    var id: Int { question.questionId }
    var questionId: Int { question.questionId }
    var text: String { question.text }
    var point: Int { question.point }
    var choices: [ChoiceViewModel] { question.choices.map(ChoiceViewModel.init) }
    
    //MARK: - Init
    init(question: QuestionDTO) {
        self.question = question
    }
}
