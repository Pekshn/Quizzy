//
//  QuizGradeViewModel.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

class QuizGradeViewModel: ObservableObject {
    
    //MARK: - Properties
    var networkService: NetworkService
    
    //MARK: - Init
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    //MARK: - Public API
    func submitQuiz(submission: QuizSubmission) async {
        do {
            let quizDTO = try await networkService.getQuizById(url: Constants.URLs.quizById(submission.quizId))
            print(quizDTO)
        } catch {
            print(error)
        }
    }
}
