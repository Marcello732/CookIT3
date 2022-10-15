
//  ContentView.swift
//  CookIT
//
//  Created by Macbook on 21/09/2022.
//

import SwiftUI
//extension Color {
//    static let appWhite = Color("appWhite")
//    static let appGreen = Color("appGreen")
//}

struct Profile: View {
    var body: some View {
        
        VStack(){
            
            HStack(){
                Image("andrzej")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    
                    .clipShape(Circle())
                    .shadow(radius: 7)
                    .frame(width: 90 ,height:90)
                    .padding(.leading, 20)
                    //.background(Color("white"))
//                VStack{
//                    HStack{
//                        Text("13")
//                           .font(.system(size: 17))
//                         .padding()
//                         .background(Color("white"))
//                         .clipShape(Circle())
//                         .frame(width: 50  , height: 50)
//                       Text("347")
//                           .font(.system(size: 17))
//                         .padding()
//                         .background(Color("white"))
//                         .clipShape(Circle())
//                       Image(systemName: "gearshape")
//                           .font(.system(size: 20.0))
//                         .padding()
//                         .background(Color("white"))
//                         .clipShape(Circle())
//                    }
//                    .foregroundColor(Color("green"))
//                    .font(.body.bold())
//                    .padding(5)
//
//               HStack(spacing:20){
//                           Text("Recipes")
//                           Text("Favorites")
//                           Text("Settings")
//
//                                                   }
//                }
                
                HStack (alignment: .firstTextBaseline , spacing: 20){
                    VStack{
                        Text("69")
                            .font(.body.bold())
                         .padding()
                         .background(Color("white"))
                         .foregroundColor(Color("green"))
                         .clipShape(Circle())
                         .frame(width: 60, height: 60)
                        Text("Recipes")
                    }
                    VStack{
                        Text("347")
                            .font(.body.bold())
                         .padding()
                         .background(Color("white"))
                         .foregroundColor(Color("green"))
                         .clipShape(Circle())
                         .frame(width: 60, height: 60)
                        Text("Favorites")
                    }
                    VStack{
                        Image(systemName: "gearshape")
                            .font(.body.bold())
                          .padding()
                          .background(Color("white"))
                          .foregroundColor(Color("green"))
                          .clipShape(Circle())
                          .frame(width: 60  , height: 60)
                        Text("Settings")
                    }
                }
                .frame(width: 260)
                
            }
            .frame(width: .infinity, height: 90)
            //.padding(5)
            
            VStack(alignment: .leading, spacing: 5){
                Text("Andrzej Piaseczny")
                    .font(.title3.bold())
                    .multilineTextAlignment(.leading)
                    .frame( width: .infinity)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis ")
                    .font(.body)
            }
            .padding(.leading, 20)
            .padding(.top, 10)
            .padding(.bottom, 10)
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
            }
            .buttonStyle(.bordered)
            
            Spacer()
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
        )
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color("gray"))
        }
    
    }

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        
        Profile()
    }
}
