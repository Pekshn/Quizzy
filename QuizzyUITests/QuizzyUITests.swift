//
//  QuizzyUITests.swift
//  QuizzyUITests
//
//  Created by Petar  on 9.2.25..
//

import XCTest

final class WhenAppIsLaunched: XCTestCase {
    
    func test_shoulDisplayAvailableQuizes() {
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
        let quizList = app.collectionViews["quizList"]
        XCTAssertEqual(2, quizList.cells.count)
    }
}

final class WhenUserTapsOnTheQuiz: XCTestCase {
    
    func test_shouldDisplayQuestionsForTheSelectedQuiz() {
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
        let quizList = app.collectionViews["quizList"]
        quizList.cells.staticTexts["Math 101"].tap()
        let _ = app.collectionViews["questionList"].waitForExistence(timeout: 2)
        XCTAssertEqual(3, app.collectionViews["questionList"].cells.count)
    }
}

final class WhenUserSubmitsQuizWithMissingAnswers: XCTestCase {
    
    func test_shouldDisplayErrorMessageOnTheScreen() {
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
        let quizList = app.collectionViews["quizList"]
        quizList.cells.staticTexts["Math 101"].tap()
        let _ = app.buttons["submitQuizButton"].waitForExistence(timeout: 2)
        app.buttons["submitQuizButton"].tap()
        XCTAssertEqual(app.staticTexts["messageText"].label, Constants.Messages.quizSubmissonFailed)
    }
}

final class WhenUserSubmitsTheQuiz: XCTestCase {
    
    func test_shouldNavigateToTheGradeScreenAndDisplayTheGrade() {
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
        let quizList = app.collectionViews["quizList"]
        quizList.cells.staticTexts["Math 101"].tap()
        
        let _ = app.collectionViews["questionList"].waitForExistence(timeout: 5)
        let questionList = app.collectionViews["questionList"]
        
        questionList.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element/*@START_MENU_TOKEN@*/.children(matching: .image).matching(identifier: "square").element(boundBy: 1)/*[[".children(matching: .image).matching(identifier: \"Square\").element(boundBy: 1)",".children(matching: .image).matching(identifier: \"square\").element(boundBy: 1)"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        questionList.children(matching: .cell).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element/*@START_MENU_TOKEN@*/.children(matching: .image).matching(identifier: "square").element(boundBy: 2)/*[[".children(matching: .image).matching(identifier: \"Square\").element(boundBy: 2)",".children(matching: .image).matching(identifier: \"square\").element(boundBy: 2)"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        questionList.children(matching: .cell).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element/*@START_MENU_TOKEN@*/.children(matching: .image).matching(identifier: "square").element(boundBy: 3)/*[[".children(matching: .image).matching(identifier: \"Square\").element(boundBy: 3)",".children(matching: .image).matching(identifier: \"square\").element(boundBy: 3)"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["submitQuizButton"]/*[[".buttons[\"Submit\"]",".buttons[\"submitQuizButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.staticTexts["A"].waitForExistence(timeout: 2))
    }
}
