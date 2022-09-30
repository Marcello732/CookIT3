//
//  RecipeRow.swift
//  CookIT
//
//  Created by Macbook on 29/09/2022.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    @State private var isFavorite = true
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
            VStack() {
                HStack() {
                    Spacer()
                    Label(String(recipe.rating), systemImage: "star.fill")
                        .frame(width: 60, height: 5 )
                        .foregroundColor(Color("green"))
                        .padding()
                        .background(Color("white"))
                        .clipShape(Capsule())
 
                    Button(action: {
                        isFavorite.toggle()
                    }, label: {
                        if isFavorite{
                            Image(systemName: "heart.fill")
                        } else {
                            Image(systemName: "heart")
                        }
                    })
                        .frame(width: 5, height: 5)
                        .foregroundColor(Color("green"))
                        .padding()
                        .background(Color("white"))
                        .clipShape(Circle())
                }
                .frame(width: .infinity, height: 40)
                .padding(5)
                .padding(.trailing, 15)
                Spacer()
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .font(.title)
                        .fontWeight(.heavy)
                    Text(recipe.description)
                }
                .foregroundColor(Color("white"))
                .padding(.bottom, 20)
            }
        }
        .background(Image(recipe.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: .infinity, height: .infinity))
        .frame(width: .infinity, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 40.0))
        .padding(10)
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: recipes[0])
    }
}
