//
//  NetworkServiceFactory.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation

class NetworkServiceFactory {
    
    //MARK: - Create NetworkService
    static func create() -> NetworkService {
        let environment = ProcessInfo.processInfo.environment["ENV"]
        if let environment = environment {
            if environment == "TEST" {
                return Webservice.shared
            } else {
                return Webservice.shared
            }
        }
        return Webservice.shared
    }
}
