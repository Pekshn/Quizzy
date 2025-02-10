//
//  QuizzyApp.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import SwiftUI

@main
struct QuizzyApp: App {
    
    //MARK: - Init
    init() {
        setupNavigatonBar()
    }
    
    //MARK: - Body
    var body: some Scene {
        WindowGroup {
            QuizListScreen()
        }
    }
}

//MARK: - Private API
extension QuizzyApp {
    
    private func setupNavigatonBar() {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.systemMint]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemMint]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
}
