//
//  QuizData.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

class QuizData {
    
    //MARK: - Load Quiz DTOs
    static func loadQuizDTOs() -> [QuizDTO] {
        guard let path = Bundle.main.path(forResource: "quizes", ofType: "json") else {
            fatalError("JSON was not found")
        }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            fatalError("Failed to load data!")
        }
        guard let quizesDTO = try? JSONDecoder().decode([QuizDTO].self, from: data) else {
            fatalError("Failed to decode data!")
        }
        return quizesDTO
    }
    
    //MARK: - Map to QuizViewModels
    static func loadQuizes() -> [QuizViewModel] {
        let quizesDTO = loadQuizDTOs()
        return quizesDTO.map(QuizViewModel.init)
    }
}
