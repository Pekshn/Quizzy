//
//  QuizGradeViewModel.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

class QuizGradeViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var grade: GradeViewModel?
    var networkService: NetworkService
    
    //MARK: - Init
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    //MARK: - Public API
    @MainActor
    func submitQuiz(submission: QuizSubmission) async {
        do {
            let quizDTO = try await networkService.getQuizById(url: Constants.URLs.quizById(submission.quizId))
            let quiz = Quiz(quizDTO: quizDTO)
            let grade = quiz.grade(submission: submission)
            self.grade = GradeViewModel(grade: grade)
        } catch {
            print(error)
        }
    }
}
