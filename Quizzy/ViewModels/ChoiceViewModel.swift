//
//  ChoiceViewModel.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

struct ChoiceViewModel: Identifiable {
    
    //MARK: - Properties
    private let choice: ChoiceDTO
    private var isSelected: Bool = false
    var id: Int { choice.choiceId }
    var choiceId: Int { choice.choiceId }
    var text: String { choice.text }
    
    //MARK: - Init
    init(choice: ChoiceDTO) {
        self.choice = choice
    }
    
    //MARK: - Public API
    mutating func setSelected() {
        isSelected = true
    }
}
