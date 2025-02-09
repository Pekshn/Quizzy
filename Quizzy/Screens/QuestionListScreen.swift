//
//  QuestionListScreen.swift
//  Quizzy
//
//  Created by Petar  on 9.2.25..
//

import SwiftUI

struct QuestionListScreen: View {
    
    //MARK: - Properties
    @State var quizSubmission: QuizSubmission
    @State private var gradeQuiz: Bool = false
    @State private var message: String = ""
    let quiz: QuizViewModel
    
    //MARK: - Body
    var body: some View {
        VStack {
            List(quiz.questions.indices, id: \.self) { index in
                let question = quiz.questions[index]
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(index + 1)")
                            .padding(10)
                            .foregroundColor(.black)
                            .background(Color.gray)
                            .clipShape(Circle())
                        
                        HStack {
                            Text(question.text)
                                .font(.system(size: 22))
                        } //: HStack
                    } //: HStack
                    
                    ForEach(question.choices) { choice in
                        HStack {
                            Image(systemName: quizSubmission.isSelected(questionId: question.questionId, choiceId: choice.choiceId) ? "checkmark.square": "square")
                                .onTapGesture {
                                    quizSubmission.addChoice(questionId: question.questionId, choiceId: choice.choiceId)
                                }
                                .foregroundColor(quizSubmission.isSelected(questionId: question.questionId, choiceId: choice.choiceId) ? .orange : .white)
                            
                            Text(choice.text)
                        } //: HStack
                    } //: ForEach
                } //: VStack
            } //: List
            .padding(.top, 20)
            .accessibilityIdentifier("questionList")
            .listStyle(.plain)
            .buttonStyle(.plain)
            
            Text(message)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .accessibility(identifier: "messageText")
            
            Button("Submit") {
                if isSubmissionValid() {
                    gradeQuiz = true
                } else {
                    message = Constants.Messages.quizSubmissonFailed
                }
            } //: Button
            .frame(maxWidth: .infinity, maxHeight: 44)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 5))
            .foregroundColor(.orange)
            .padding()
            .accessibility(identifier: "submitQuizButton")
            
            Spacer()
        } //: VStack
        .onAppear(perform: {
            quizSubmission = QuizSubmission(quizId: quiz.quizId)
        }) //: onAppear
        .navigationDestination(isPresented: $gradeQuiz) {
            QuizGradeScreen(submission: quizSubmission, quiz: quiz)
        } //: navigationDestination
    }
}

//MARK: - Private API
extension QuestionListScreen {
    
    private func isSubmissionValid() -> Bool {
        return quizSubmission.selectedChoices.count == quiz.questions.count
    }
}

//MARK: - Preview
struct QuestionListScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        let quiz = QuizData.loadQuizes()[0]
        NavigationView {
            QuestionListScreen(quizSubmission: QuizSubmission(quizId: quiz.quizId), quiz: quiz)
                .navigationTitle(quiz.title)
        }
    }
}
