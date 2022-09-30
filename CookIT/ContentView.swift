//
//  ContentView.swift
//  CookIT
//
//  Created by Macbook on 21/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection = 0
    // .enviroments(\.symbolsVariants, .none)
    // to make icon non filled
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("green"))
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("white"))
        //UITabBar.appearance().isTranslucent = true
        //UITabBar.appearance().selectedItem.foregroundColor(Color("white"))
    }
    
    var body: some View {
        TabView (selection: $selection){
                DiscoverView()
                    .tabItem {
                        if selection == 1 {
                            Label("Discover", systemImage: "house")
                            .foregroundColor(Color("white"))
                        }else {
                            Label("Discover", systemImage: "house")
                                .environment(\.symbolVariants, .none)
                            .foregroundColor(Color("white"))
                        }
                    }
                    .tag(1)
                FavoritesView()
                    .tabItem {
                        if selection == 2 {
                            Label("Favorites", systemImage: "heart")
                            .foregroundColor(Color("white"))
                        }else {
                            Label("Favorites", systemImage: "heart")
                                .environment(\.symbolVariants, .none)
                            .foregroundColor(Color("white"))
                        }
                    }
                    .tag(2)
                AddRecipeView()
                    .tabItem {
                        if selection == 3 {
                            Label("Add recipe", systemImage: "plus.app")
                            .foregroundColor(Color("white"))
                        }else {
                            Label("Add recipe", systemImage: "plus.app")
                                .environment(\.symbolVariants, .none)
                            .foregroundColor(Color("white"))
                        }
                    }
                    .tag(3)
                ProfileView()
                    .tabItem {
                        if selection == 4 {
                            Label("Profile", systemImage: "person")
                            .foregroundColor(Color("white"))
                        }else {
                            Label("Profile", systemImage: "person")
                                .environment(\.symbolVariants, .none)
                            .foregroundColor(Color("white"))
                        }
                    }
                    .tag(4)
            }
            .background(Color("white"))
            .accentColor(Color("white"))
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

struct DiscoverView: View {
    var body: some View {
        NavigationView {
            List(recipes) {recipe in
                NavigationLink {
                    //RecipeDetail()
                    Text(recipe.name)
                } label: {
                    RecipeRow(recipe: recipe)
                }
            }
            .navigationTitle("Discover")
        }
        Text("test")
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
