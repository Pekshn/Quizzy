//
//  Choice.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

class Choice {
    
    //MARK: - Properties
    let choiceId: Int
    let text: String
    let isCorrect: Bool
    
    //MARK: - Init
    init(choiceDTO: ChoiceDTO) {
        self.choiceId = choiceDTO.choiceId
        self.text = choiceDTO.text
        self.isCorrect = choiceDTO.isCorrect
    }
}
