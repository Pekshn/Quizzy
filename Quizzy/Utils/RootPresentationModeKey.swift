//
//  RootPresentationModeKey.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import Foundation
import SwiftUI

typealias RootPresentationMode = QuizViewModel?

//MARK: - RootPresentationMode EnvironmentKey
private struct RootPresentationModeKey: EnvironmentKey {
    
    //MARK: - Properties
    static let defaultValue: Binding<RootPresentationMode> = .constant(nil)
}

//MARK: - EnvironmentValues
extension EnvironmentValues {
    
    //MARK: - Properties
    var rootPresentationMode: Binding<RootPresentationMode> {
        get { self[RootPresentationModeKey.self] }
        set { self[RootPresentationModeKey.self] = newValue }
    }
}

extension RootPresentationMode {
    
    //MARK: - Dismiss
    mutating func dismiss() {
        self = nil
    }
}
