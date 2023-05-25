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
        return firstValue + secondValue
    }
    
    //User interface
    var body: some View {
        VStack(spacing: 0) {
            
            //Question
            Group {
                HStack{
                    Text(Operation.multiplication.rawValue)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("\(firstValue)")
                        Text("\(secondValue)")
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
                    }
                    
                    //Show if answer is checked and incorrect
                    if answerChecked == true && answerCorrect == false {
                        Image(systemName: "x.square")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .font(Font.custom("SF Pro", size: 64))

    }
}

struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
