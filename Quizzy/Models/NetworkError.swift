//
//  NetworkError.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
    case badURL
}
