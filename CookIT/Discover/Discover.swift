//
//  Discover.swift
//  CookIT
//
//  Created by Macbook on 12/10/2022.
//

import SwiftUI

struct Discover: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    ForEach(recipes, id:\.id) { recipe in
                        NavigationLink(
                            destination: RecipeDetails(recipe: recipe), label:{ RecipeRow(recipe: recipe)}
                        )
                    }
                }
                .navigationBarTitle("Discover")
                   
                    //.toolbar(Color("green"), for: .na)
                    //.navigationBarHidden(true)
//                .navigationTitle("Discover")
//                .navigationBarTitleDisplayMode(.large)
//                .navigationBarBackButtonHidden(true)
            }
            .background(Color("gray"))
        }
        
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}
