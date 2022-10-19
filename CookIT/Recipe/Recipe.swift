//
//  Recipe.swift
//  CookIT
//
//  Created by Macbook on 29/09/2022.
//

import Foundation
import SwiftUI

struct Recipe: Hashable, Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let isFavorite: Bool
    let preparationTime: Int
    let difficultyLevel: Int
    let rating: Float
    let author: String
//    var stickers: [String]
//    var macros: [String]
    let stickers, macros, ingredients, amounts, preparationSteps: [String]
//    var preparationSteps: [String]

    let imageName: String
    var image: Image {
        Image(imageName)
    }
    
//    struct Macros {
//        let calories, protein, carbs, fat: Int
//    }
}
