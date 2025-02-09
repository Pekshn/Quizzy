//
//  Constants.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

struct Constants {
    
    //MARK: - Properties
    static let baseURL = URL(string: "https://warp-wiry-rugby.glitch.me")!
    
    //MARK: - Children
    struct URLs {
        static let allQuizes = baseURL.appendingPathComponent("/all-quizes")
        static func quizById(_ quizId: Int) -> URL {
            baseURL.appendingPathComponent("/quizes/\(quizId)")
        }
    }
    
    struct Messages {
        static let quizSubmissonFailed = "Unable to submit quiz.\nPlease answer all questions."
    }
}
