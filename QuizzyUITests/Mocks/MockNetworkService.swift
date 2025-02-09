//
//  MockNetworkService.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

class MockNetworkService: NetworkService {
    
    //MARK: - Properties
    static let shared = MockNetworkService()
    
    //MARK: - Init
    private init() { }
    
    //MARK: - Mocking API calls
    func getAllQuizes(url: URL) async throws -> [QuizDTO] {
        return QuizData.loadQuizDTOs()
    }
    
    func getQuizById(url: URL) async throws -> QuizDTO {
        let quizesDTO = QuizData.loadQuizDTOs()
        return quizesDTO.first { $0.quizId == 1 }!
    }
}
