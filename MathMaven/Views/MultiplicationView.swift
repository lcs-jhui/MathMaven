//
//  MultiplicationView.swift
//  MathMaven
//
//  Created by Russell Gordon on 2023-05-24.
//

import SwiftUI

struct MultiplicationView: View {
    
    //MARK: Stored Properties
    
    //Numbers for the question
    @State var firstValue = Int.random(in: 1...72)
    @State var secondValue = Int.random(in: 1...72)

    //Holds the input by the user
    @State var input = ""
    
    //indicates if the answer has been checked
    @State var answerChecked = false
    
    //Inidicate if the answer is correct
    @State var answerCorrect = false
    
    //MARK: Computed Properties
    
    //The correct answer
    var correctResponse: Int {
        return firstValue * secondValue
    }
    
    //User interface
    var body: some View {
        VStack(spacing: 0) {
            
            //Question
            Group {
                HStack{
                    Text(Operation.multiplication.rawValue)
                        .font(Font.custom("SF Pro", size: 64))
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("\(firstValue)")
                            .font(Font.custom("SF Pro", size: 64))
                        Text("\(secondValue)")
                            .font(Font.custom("SF Pro", size: 64))
                    }
                }
                
                Divider()
            }
            .padding(.horizontal)
            
            //Answer input
            HStack{
                
                ZStack{
                    
                    //Only show when the answer is correct
                    if answerCorrect == true {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                            .font(Font.custom("SF Pro", size: 64))
                    }
                    
                    //Show if answer is checked and incorrect
                    if answerChecked == true && answerCorrect == false {
                        Image(systemName: "x.square")
                            .foregroundColor(.red)
                            .font(Font.custom("SF Pro", size: 64))
                    }
                }
                
                Spacer()
                
                TextField("Type Answer Here",
                          text: $input)
                    .multilineTextAlignment(.trailing)
                    .font(.largeTitle)
            }
            .padding(.horizontal)
            
            Spacer()
            
            //Check answer
            //Only show button if answer hasn't been checked
            if answerChecked == false {
                
                CheckAnswerButtonView(input: input,
                                      correctResponse: correctResponse, answerChecked: $answerChecked, answerCorrect: $answerCorrect)
            } else {
                
                //Generate new question
                //Only show button if answer has been checked
                Button(action: {
                    generateNewQuestion()
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                .padding()
                .buttonStyle(.bordered)
            }
            
            //Push interface up
            Spacer()
        }
    }
    
    //MARK: Functions
    
    //Generate new question
    func generateNewQuestion() {
        
        // Generate a new question
        firstValue = Int.random(in: 1...72)
        secondValue = Int.random(in: 1...72)

        // Reset properties that track what's happening with the current question
        answerChecked = false
        answerCorrect = false
        
        // Reset the input field
        input = ""

    }
}

struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
