//
//  ContentView.swift
//  CookIT
//
//  Created by Macbook on 21/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("green"))
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("white"))
        UITabBar.appearance().isTranslucent = true
        //UITabBar.appearance().selectedItem.foregroundColor(Color("white"))
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView {
                DiscoverView()
                    .tabItem {
                        Label("Discover", systemImage: "house")
                            .foregroundColor(Color("white"))
                    }
                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }
                FavoritesView()
                    .tabItem {
                        Label("Add Recipe", systemImage: "plus.square")
                    }
                FavoritesView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
            .background(Color("white"))
//            .frame(
//                  minWidth: 0,
//                  maxWidth: .infinity,
//                  minHeight: 0,
//                  maxHeight: .infinity,
//                  alignment: .topLeading
//            )
            
        .ignoresSafeArea()
        }
    }
}

struct DiscoverView: View {
    var body: some View {
        NavigationView {
            List(recipes) {recipe in
                NavigationLink {
                    //RecipeDetail()
                } label: {
                    RecipeRow(recipe: recipe)
                }
            }
            .navigationTitle("Discover")
        }
    }
}
struct FavoritesView: View {
    var body: some View {
        Text("Favorites View")
            .font(.title)
            .foregroundColor(.blue)
    }
}
struct AddRecipeView: View {
    var body: some View {
        Text("Add Recipe")
            .font(.title)
            .foregroundColor(.blue)
    }
}
struct ProfileView: View {
    var body: some View {
        Text("Profile")
            .font(.title)
            .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
