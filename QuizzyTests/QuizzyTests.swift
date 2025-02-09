//
//  QuizzyTests.swift
//  QuizzyTests
//
//  Created by Petar  on 9.2.25..
//

import XCTest

final class WhenLoadingQuiz: XCTestCase {
    
    //MARK: - Testing methods
    func test_shouldMakeSureThatQuizTotalPointsAreCalculatedCorrectly() {
        let quizDTOs = QuizData.loadQuizDTOs()
        let quizes = quizDTOs.map(Quiz.init)
        let mathQuiz = quizes.first {
            $0.quizId == 1
        }!
        XCTAssertEqual(3, mathQuiz.questions.count)
        XCTAssertEqual(30, mathQuiz.totalPoints)
    }
}

final class WhenCalculatingStudentsGrade: XCTestCase {
    
    //MARK: - Properties
    var mathQuiz: Quiz!
    lazy var gradeSubmissionA: QuizSubmission = {
        var userSubmission = QuizSubmission(quizId: 1)
        userSubmission.addChoice(questionId: 1, choiceId: 2)
        userSubmission.addChoice(questionId: 2, choiceId: 3)
        userSubmission.addChoice(questionId: 3, choiceId: 4)
        return userSubmission
    }()
    lazy var gradeSubmissionB: QuizSubmission = {
        var userSubmission = QuizSubmission(quizId: 1)
        userSubmission.addChoice(questionId: 1, choiceId: 1)
        userSubmission.addChoice(questionId: 2, choiceId: 3)
        userSubmission.addChoice(questionId: 3, choiceId: 4)
        return userSubmission
    }()
    lazy var gradeSubmissionF: QuizSubmission = {
        var userSubmission = QuizSubmission(quizId: 1)
        userSubmission.addChoice(questionId: 1, choiceId: 4)
        userSubmission.addChoice(questionId: 2, choiceId: 2)
        userSubmission.addChoice(questionId: 3, choiceId: 1)
        return userSubmission
    }()
    
    //MARK: - Lifecycle
    override func setUp() {
        super.setUp()
        let quizDTOs = QuizData.loadQuizDTOs()
        let quizes = quizDTOs.map(Quiz.init)
        self.mathQuiz = quizes.first {
            $0.quizId == 1
        }!
    }
    
    override func tearDown() {
        mathQuiz = nil
        super.tearDown()
    }
    
    //MARK: - Testing methods
    func test_calculateGradeSuccessfullyBasedOnStudentsScore() {
        XCTAssertEqual("A", mathQuiz.calculateLetterGrade(score: 90))
        XCTAssertEqual("B", mathQuiz.calculateLetterGrade(score: 72))
        XCTAssertEqual("F", mathQuiz.calculateLetterGrade(score: 42))
    }
    
    func test_calculateGradeBasedOnStudentsSubmission() {
        XCTAssertEqual("A", mathQuiz.grade(submission: gradeSubmissionA).letter)
        XCTAssertEqual("B", mathQuiz.grade(submission: gradeSubmissionB).letter)
        XCTAssertEqual("F", mathQuiz.grade(submission: gradeSubmissionF).letter)
    }
}
