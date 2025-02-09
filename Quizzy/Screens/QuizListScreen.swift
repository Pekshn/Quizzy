//
//  QuizListScreen.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import SwiftUI

struct QuizListScreen: View {
    
    //MARK: - Properties
    @State private var isActive: Bool = false
    @StateObject private var quizListVM = QuizListViewModel(networkService: NetworkServiceFactory.create())
    @State private var selectedQuiz: QuizViewModel?
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            List(quizListVM.quizes) { quiz in
                NavigationLink(
                    destination: {
                        QuestionListScreen(quizSubmission: QuizSubmission(quizId: quiz.quizId), quiz: quiz)
                    },
                    label: {
                        Text(quiz.title)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                ) //: NavigationLink
            } //: List
            .foregroundColor(.orange)
            .padding(.vertical, 30)
            .accessibilityIdentifier("quizList")
            .task {
                await quizListVM.populateAllQuizes()
            } //: task
            .navigationTitle("Quizzy")
        } //: NavigationStack
        .environment(\.rootPresentationMode, $selectedQuiz)
        .accentColor(.orange)
    }
}

//MARK: - Preview
struct QuizListScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        QuizListScreen()
    }
}
