//
//  QuizViewModel.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

struct QuizViewModel: Identifiable, Hashable {
    
    //MARK: - Properties
    private let quiz: QuizDTO
    let id = UUID()
    var quizId: Int { quiz.quizId }
    var title: String { quiz.title }
    var questions: [QuestionViewModel] { quiz.questions.map(QuestionViewModel.init) }
    
    //MARK: - Init
    init(quiz: QuizDTO) {
        print(Bundle.main.paths(forResourcesOfType: "json", inDirectory: nil))
        self.quiz = quiz
    }
    
    //MARK: - Hashable
    static func == (lhs: QuizViewModel, rhs: QuizViewModel) -> Bool {
        return lhs.quizId == rhs.quizId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(quizId)
    }
}
