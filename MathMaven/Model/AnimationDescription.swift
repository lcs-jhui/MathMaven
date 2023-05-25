//
//  FavouriteAnimation.swift
//  LottieAnimationsTest
//
//  Created by Russell Gordon on 2023-01-27.
//

import Foundation

struct AnimationDesc: Identifiable {
    
    let id = UUID()
    let fileName: String
    let description: String
    
}

// Create a list of animations that are favourites
let favourites = [

    AnimationDesc(fileName: "119540-correct-answer",
                       description: "correct answer")
    
    ,

    AnimationDesc(fileName: "119539-incorrect-answer,
                       description: "incorrect answer")
]
