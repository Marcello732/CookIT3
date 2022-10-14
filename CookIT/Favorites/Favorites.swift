//
//  Favorites.swift
//  CookIT
//
//  Created by Macbook on 12/10/2022.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    ForEach(recipes, id:\.id) { recipe in
                        if recipe.isFavorite {
                        NavigationLink(
                            destination: RecipeDetails(recipe: recipe), label:{ RecipeRow(recipe: recipe)}
                        )
                        }
                    }
                }
                .navigationBarTitle("Favorites")
                    //.toolbar(Color("green"), for: .na)
                    //.navigationBarHidden(true)
//                .navigationTitle("Discover")
//                .navigationBarTitleDisplayMode(.large)
//                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
