//
//  GradeViewModel.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

struct GradeViewModel {
    
    //MARK: - Properties
    private let grade: Grade
    var letter: String { grade.letter.uppercased() }
    var score: Int { grade.score }
    
    //MARK: - Init
    init(grade: Grade) {
        self.grade = grade
    }
}
