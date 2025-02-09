//
//  WebService.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

class Webservice: NetworkService {
    
    //MARK: - Properties
    static let shared = Webservice()
    
    //MARK: - Init
    private init() { }
    
    //MARK: - API Calls
    func getAllQuizes(url: URL) async throws -> [QuizDTO] {
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        guard let decodedData = try? JSONDecoder().decode([QuizDTO].self, from: data) else {
            throw NetworkError.decodingError
        }
        return decodedData
    }
    
    func getQuizById(url: URL) async throws -> QuizDTO {
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        guard let decodedData = try? JSONDecoder().decode(QuizDTO.self, from: data) else {
            throw NetworkError.decodingError
        }
        return decodedData
    }
}
