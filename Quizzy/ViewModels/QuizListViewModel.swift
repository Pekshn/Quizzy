//
//  QuizListViewModel.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

class QuizListViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var quizes: [QuizViewModel] = []
    var networkService: NetworkService
    
    //MARK: - Init
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    //MARK: - Public API
    func populateAllQuizes() async {
        do {
            let quizes = try await networkService.getAllQuizes(url: Constants.URLs.allQuizes)
            self.quizes = quizes.map(QuizViewModel.init)
        } catch {
            print(error)
        }
    }
}
