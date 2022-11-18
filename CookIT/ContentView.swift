//
//  ContentView.swift
//  CookIT
//
//  Created by Macbook on 21/09/2022.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network

    var body: some View {
        ScrollView {
            Text("All users")
                .font(.title)
                .bold()

            VStack(alignment: .leading) {
                ForEach(network.users) { user in
                    HStack(alignment:.top) {
                        Text("\(user.id)")

                        VStack(alignment: .leading) {
                            Text(user.login)
                                .bold()

                            Text(user.firstName)

                            Text(user.email.lowercased())
                        }
                    }
                    .frame(width: 300, alignment: .leading)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                    .cornerRadius(20)
                }
            }

        }
        .padding(.vertical)
        .onAppear {
            network.getUsers()
        }
    }
}
    
// --------------------------------------
    
//    @State var selection = 1
//    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(Color("green"))]
////    navigationController?.navigationBar.titleTextAttributes = textAttributes
//    // .enviroments(\.symbolsVariants, .none)
//    // to make icon non filled
//
//    init() {
//        UITabBar.appearance().shadowImage = UIImage()
//        UITabBar.appearance().backgroundImage = UIImage()
//        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("white"))
//        UITabBar.appearance().isTranslucent = true
//        UITabBar.appearance().backgroundColor = UIColor(Color("green"))
//    }
//
//    var body: some View {
//        TabView (selection: $selection){
//                Discover()
//                    .tabItem {
//                        if selection == 1 {
//                            Label("Discover", systemImage: "house")
//                            .foregroundColor(Color("white"))
//                        }else {
//                            Label("Discover", systemImage: "house")
//                                .environment(\.symbolVariants, .none)
//                            .foregroundColor(Color("white"))
//                        }
//                    }
//                    .tag(1)
//                Favorites()
//                    .tabItem {
//                        if selection == 2 {
//                            Label("Favorites", systemImage: "heart")
//                            .foregroundColor(Color("white"))
//                        }else {
//                            Label("Favorites", systemImage: "heart")
//                                .environment(\.symbolVariants, .none)
//                            .foregroundColor(Color("white"))
//                        }
//                    }
//                    .tag(2)
//                AddRecipeView()
//                    .tabItem {
//                        if selection == 3 {
//                            Label("Add recipe", systemImage: "plus.app")
//                            .foregroundColor(Color("white"))
//                        }else {
//                            Label("Add recipe", systemImage: "plus.app")
//                                .environment(\.symbolVariants, .none)
//                            .foregroundColor(Color("white"))
//                        }
//                    }
//                    .tag(3)
//                Profile()
//                    .tabItem {
//                        if selection == 4 {
//                            Label("Profile", systemImage: "person")
//                            .foregroundColor(Color("white"))
//                        }else {
//                            Label("Profile", systemImage: "person")
//                                .environment(\.symbolVariants, .none)
//                            .foregroundColor(Color("white"))
//                        }
//                    }
//                    .tag(4)
//            }
//
//            //.background(Color("green"))
//            .accentColor(Color("white"))
//            .ignoresSafeArea()
//            .frame(
//                  minWidth: 0,
//                  maxWidth: .infinity,
//                  minHeight: 0,
//                  maxHeight: .infinity,
//                  alignment: .topLeading
//            )
//
//    }
//}

struct AddRecipeView: View {
    var body: some View {
        Text("Add Recipe")
            .font(.title)
            .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
