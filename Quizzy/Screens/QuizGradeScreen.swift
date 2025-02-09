//
//  QuizGradeScreen.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import SwiftUI

struct QuizGradeScreen: View {
    
    //MARK: - Properties
    @StateObject private var quizGradeVM = QuizGradeViewModel(networkService: NetworkServiceFactory.create())
    @State private var startOver: Bool = false
    @Environment(\.rootPresentationMode) var rootPresentationMode
    let submission: QuizSubmission
    let quiz: QuizViewModel
    
    //MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            
            Spacer()
            Button("Start over") {
                rootPresentationMode.wrappedValue.dismiss()
            } //: Button
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
            } //: overlay
            .foregroundColor(.orange)
            
        } //: VStack
        .navigationTitle(quiz.title)
        .navigationBarBackButtonHidden(true)
        .task {
            await quizGradeVM.submitQuiz(submission: submission)
        } //: task
    }
}

//MARK: - Preview
struct GradeScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        let submission = QuizSubmission(quizId: 1)
        let quiz = QuizData.loadQuizes()[0]
        NavigationView {
            QuizGradeScreen(submission: submission, quiz: quiz)
        }
    }
}
