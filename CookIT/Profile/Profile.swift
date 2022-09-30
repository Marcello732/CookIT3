
//  ContentView.swift
//  CookIT
//
//  Created by Macbook on 21/09/2022.
//

import SwiftUI
extension Color {
    static let appWhite = Color("appWhite")
    static let appGreen = Color("appGreen")
}

struct Profile: View {
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack(){
                Image("andrzej")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:.infinity,height:80)
                    .clipShape(Circle())
                    .shadow(radius: 7)
                    .background(Color.appWhite)
                VStack{
                    HStack{
                        Text("13")
                           .font(.system(size: 17))
                         .padding()
                         .background(.blue)
                         .clipShape(Circle())
                         .frame(width: 50  , height: 50)
                       Text("347")
                           .font(.system(size: 17))
                         .padding()
                         .background(.blue)
                         .clipShape(Circle())
                       Image(systemName: "gearshape")
                           .font(.system(size: 20.0))
                         .padding()
                         .background(.blue)
                         .clipShape(Circle())
                    }
                    .padding(5)
                
               HStack(spacing:20){
                           Text("Recipes")
                           Text("Favorites")
                           Text("Settings")
               
                                                   }
                }
                .frame(width: 250)
                
            }
            .frame(width: .infinity, height: 80)
            .padding(5)
            
                VStack{
                    Text("Andrzej Piaseczny")
                                            .font(.system(size: 13, weight: .heavy, design: .default))
                                            .multilineTextAlignment(.leading)
                                            .frame( width: .infinity)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis ")
                }
                .frame(width: .infinity)
            
            HStack{
                Spacer()
                Button(action: {}){
                    Text("Edit Profile")
                        .foregroundColor(Color.black)
                }
                Spacer()
                Button(action: {}){
                    Text("Log out")
                        .foregroundColor(Color.black)
                }
                Spacer()
                
                
            }.buttonStyle(.bordered)
            Spacer()
            
        
        }
        .background(Color.appWhite)
        
        }
    
    }

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
