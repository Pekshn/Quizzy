//
//  NetworkService.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

//MARK: - NetworkService protocol
protocol NetworkService {
    func getAllQuizes(url: URL) async throws -> [QuizDTO]
    func getQuizById(url: URL) async throws -> QuizDTO
}
