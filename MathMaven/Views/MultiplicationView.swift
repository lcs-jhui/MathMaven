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
    @State var firstValue = Int-.random(in: 1...72)
    @State var secondValue = Int.random(in: 1...72)

    //Holds the input by the user
    @State var input = ""
    
    //indicates if the answer has been checked
    @State var answerChecked = false
    
    //Inidicate if the answer is correct
    @State var answerCorrect = false
    
    //MARK: Computed Properties
    
    //The correct answer
    @State var correctResponse: Int {
        return firstValue + secondValue
    }
    
    //User interface
    var body: some View {
        VStack {
            Text("Multiplication")
            Text(Operation.multiplication.rawValue)
        }
    }
}

struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
