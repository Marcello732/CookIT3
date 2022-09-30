//
//  Recipe.swift
//  CookIT
//
//  Created by Macbook on 29/09/2022.
//

import Foundation
import SwiftUI

struct Recipe: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var isFavorite: Bool
    var preparationTime: Int
    var difficultyLevel: Int
    var rating: Float
    var stickers: [String]
    var macros: [String : Int]
    var ingredients: [String]
    var preparationSteps: [Int : String]

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
