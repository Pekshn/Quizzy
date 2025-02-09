//
//  Quiz.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

class Quiz {
    
    //MARK: - Properties
    let quizId: Int
    let title: String
    let questions: [Question]
    var totalPoints: Int { questions.reduce(0) { $0 + $1.point } }
    
    //MARK: - Init
    init(quizDTO: QuizDTO) {
        self.quizId = quizDTO.quizId
        self.title = quizDTO.title
        self.questions = quizDTO.questions.map(Question.init)
    }
    
    func calculateLetterGrade(score: Double) -> String {
        switch score {
        case 0...59:
            return "F"
        case 60...89:
            return "B"
        case 90...100:
            return "A"
        default:
            return "N/A"
        }
    }
    
    func grade(submission: QuizSubmission) -> Grade {
        var submissionTotal = 0
        questions.forEach { question in
            let correctChoice = question.choices.first(where: { $0.isCorrect })
            let userChoiceId = submission.selectedChoices[question.questionId]
            if let correctChoice = correctChoice, let userChoiceId = userChoiceId {
                if correctChoice.choiceId == userChoiceId {
                    submissionTotal += question.point
                }
            }
        }
        let score = (Double(submissionTotal) / Double(totalPoints)) * 100
        let letterGrade = calculateLetterGrade(score: score)
        return Grade(letter: letterGrade, score: Int(score))
    }
}
