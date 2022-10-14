//
//  RecipeDetails.swift
//  CookIT
//
//  Created by Macbook on 06/10/2022.
//

import SwiftUI

var difficultyLevelDict: [Int : String] = [
    1 : "Very Easy",
    2 : "Easy",
    3 : "Medium",
    4 : "Hard",
    5 : "Very Hard"
]

struct RecipeDetails: View {
    var recipe: Recipe
    @State private var isFavorite = true

    var body: some View {
        VStack {
            ImageAndName(recipe: recipe, isFavorite: isFavorite)
            
            HStack() {
                Spacer()
                Text(String(recipe.preparationTime) + " min")
                    .frame(width: 70, height: 5 )
                    .foregroundColor(Color("white"))
                    .padding()
                    .background(Color("green"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
                Text(difficultyLevelDict[recipe.difficultyLevel] ?? "Medium")
                    .frame(width: 70, height: 5 )
                    .foregroundColor(backgroundColor(for: recipe.difficultyLevel))
                    .padding()
                    .background(Color("green"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
                Text(String(recipe.rating))
                    .frame(width: 70, height: 5 )
                    .foregroundColor(Color("white"))
                    .padding()
                    .background(Color("green"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
            }
            .font(.body.bold())
            .frame(width: .infinity)

    
            
            VStack (alignment: .leading, spacing: 20) {
                HStack {
                    Text("Description")
                        .font(.title.bold())
                        .padding(.top, 10)
                    Spacer()
                }
                //Spacer()
                Text(recipe.description)
                    .font(.body)
                    .frame(width: .infinity)
            }
            .foregroundColor(Color("green"))
            .padding(.leading, 20)
            .padding(.trailing, 20)
//            .padding(.top, 10)
//            .padding(.bottom, 10) //zobaczymy czy dodac
            .frame(width: .infinity)
            
            Macros(recipe: recipe)
            
            Spacer()
            
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
        )
        .ignoresSafeArea()
        .background(Color("white"))
    }
}

func backgroundColor(for difficultyLevel: Int) -> Color {
    switch difficultyLevel {
    case 1:
        return .green
    case 2:
        return .yellow
    case 3:
        return .blue
    case 4:
        return .black
    case 5:
        return .red
    default:
        return Color("white")
    }
}

struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ImageAndName: View {
    var recipe: Recipe
    @State var isFavorite: Bool
    
    var body: some View{
        ZStack () {
            VStack {
                HStack() {
                    Button(
                        action: {
                            isFavorite.toggle()
                        },
                        label: {
                            Image(systemName: "chevron.backward")
                        }
                    )
                    .frame(width: 40, height: 40)
                    .background(Color("white"))
                    .foregroundColor(Color("green"))
                    .clipShape(Circle())
                    .id(isFavorite)
                    
                    Spacer()
                    
                    Button(
                        action: {
                            isFavorite.toggle()
                        },
                        label: {
                            Image(systemName: "heart.fill")
                        }
                    )
                    .frame(width: 40, height: 40)
                    .background(Color("white"))
                    .foregroundColor(Color("green"))
                    .clipShape(Circle())
                    .id(isFavorite)
                    Button(
                        action: {
                            isFavorite.toggle()
                        },
                        label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                    )
                    .frame(width: 40, height: 40)
                    .background(Color("white"))
                    .foregroundColor(Color("green"))
                    .clipShape(Circle())
                    .id(isFavorite)
                }
                .padding(.leading, 10)
                .padding(.trailing, 10)
                
                Spacer()
                
                Text(recipe.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("white"))
            }
            .padding(.top, 40)
            .padding(.bottom, 40)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .frame(width: .infinity, height: 300)
        .background(Image(recipe.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: .infinity, height: .infinity)
                .clipShape(RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 120)) //tu zmienic jeszcze ten radius by bylo tak bardziej rounded/ładniej
        )
    }
}

struct Macros: View {
    var recipe: Recipe
    
    var body: some View{
    VStack (alignment: .leading) {
        HStack {
            Text("Macros")
                .font(.title.bold())
                .padding(.top, 10)
            Spacer()
        }
        HStack() {
            Label("500", systemImage: "flame")
                .font(.subheadline)
                .frame(width: 70, height: 30)
                .foregroundColor(Color("white"))
                .padding(2)
                .background(Color("green"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Label("500", systemImage: "fish")
                .font(.subheadline)
                .frame(width: 70, height: 30)
                .foregroundColor(Color("white"))
                .padding(2)
                .background(Color("green"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Label("500", systemImage: "laurel.trailing")
                .font(.subheadline)
                .frame(width: 70, height: 30)
                .foregroundColor(Color("white"))
                .padding(2)
                .background(Color("green"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Label("500", systemImage: "drop.degreesign")
                .font(.subheadline)
                .frame(width: 70, height: 30)
                .foregroundColor(Color("white"))
                .padding(2)
                .background(Color("green"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(width: .infinity)
    }
    .foregroundColor(Color("green"))
    .padding(.leading, 20)
    .padding(.trailing, 20)
//            .padding(.top, 10)
//            .padding(.bottom, 10) //zobaczymy czy dodac
    .frame(width: .infinity)
}
}

struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails(recipe: recipes[4])
    }
}
