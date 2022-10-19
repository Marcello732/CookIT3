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
        ScrollView {
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
                
                Ingredients(recipe: recipe)
                
                PreparationSteps(recipe: recipe)
                
                Author(recipe: recipe)
                
                Reviews(recipe: recipe)
                Spacer()
                
            }
        }
        .padding(.bottom, 80)
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
        )
        .ignoresSafeArea()
        .background(Color("gray"))
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
            Label(recipe.macros[0], systemImage: "flame")
                .font(.subheadline)
                .frame(width: 70, height: 30)
                .foregroundColor(Color("white"))
                .padding(2)
                .background(Color("green"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Label(recipe.macros[1], systemImage: "fish")
                .font(.subheadline)
                .frame(width: 70, height: 30)
                .foregroundColor(Color("white"))
                .padding(2)
                .background(Color("green"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Label(recipe.macros[2], systemImage: "laurel.trailing")
                .font(.subheadline)
                .frame(width: 70, height: 30)
                .foregroundColor(Color("white"))
                .padding(2)
                .background(Color("green"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Label(recipe.macros[3], systemImage: "drop.degreesign")
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

struct Ingredients: View {
    var recipe: Recipe
    
    var body: some View{
    VStack (alignment: .leading) {
        HStack {
            Text("Ingredients")
                .font(.title.bold())
                .padding(.top, 10)
            Spacer()
        }
        ForEach(0..<recipe.ingredients.count){ number in
            Text(recipe.amounts[number] + " " + recipe.ingredients[number])
                .font(.subheadline)
                .foregroundColor(Color("white"))
                .padding(8)
                .background(Color("green"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                //.frame(width: .infinity, height: 30)
            Spacer()
        }
    }
    .foregroundColor(Color("green"))
    .padding(.leading, 20)
    .padding(.trailing, 20)
//            .padding(.top, 10)
//            .padding(.bottom, 10) //zobaczymy czy dodac
    .frame(width: .infinity)
}
}

struct PreparationSteps: View {
    var recipe: Recipe
    
    var body: some View{
    VStack (alignment: .leading) {
        HStack {
            Text("Preparation")
                .font(.title.bold())
                .padding(.top, 10)
            Spacer()
        }
        ForEach(0..<recipe.preparationSteps.count){ number in
            VStack(alignment: .leading) {
                Text(String(number + 1) + ". " +  recipe.preparationSteps[number])
                    .font(.subheadline)
                
                Rectangle()
                    .frame(width: .infinity, height: 1)
            }.padding(.top, 5)
            .foregroundColor(Color("green"))
            .frame(width: .infinity)
            Spacer()
        }
    }
    .foregroundColor(Color("green"))
    .padding(.leading, 20)
    .padding(.trailing, 20)
//            .padding(.top, 10)
//            .padding(.bottom, 10) //zobaczymy czy dodac
    .frame(width: .infinity)
}
}

struct Author: View {
    var recipe: Recipe
    
    var body: some View{
        HStack () {
            Text("Author")
                .font(.title2.bold())
            
            Text(recipe.author)
                .font(.title2)
            Spacer()
        }
        .foregroundColor(Color("green"))
        .foregroundColor(Color("green"))
        .padding(.leading, 20)
        .padding(.trailing, 20)
        .padding(.top, 10)
    //            .padding(.top, 10)
    //            .padding(.bottom, 10) //zobaczymy czy dodac
        .frame(width: .infinity)
    }
}


//to jeszcze do dorobienia
//tzn te iconki profili w reviews
struct Reviews: View {
    var recipe: Recipe
    
    var body: some View{
        HStack () {
            VStack (alignment: .leading) {
                HStack () {
                Image("star_empty")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                Image("star_empty")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                Image("star_empty")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                Image("star_empty")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                Image("star_empty")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                }
                Text("2.2k reviews")
                    .foregroundColor(Color("white"))
                    .font(.subheadline.bold())
            }
            
            .padding(.leading, 10)
            .padding(.top, 5)
            .padding(.bottom, 5)
            Spacer()
            ZStack () {
                HStack() {
                Button(
                    action: {
                    },
                    label: {
                        Image(systemName: "heart.fill")
                    }
                )
                .frame(width: 40, height: 40)
                .background(Color("white"))
                .foregroundColor(Color("green"))
                .clipShape(Circle())
                    Button(
                        action: {
                        },
                        label: {
                            Image(systemName: "heart.fill")
                        }
                    )
                    .frame(width: 40, height: 40)
                    .background(Color("green"))
                    .foregroundColor(Color("green"))
                    .clipShape(Circle())
                    Button(
                        action: {
                        },
                        label: {
                            Image(systemName: "heart.fill")
                        }
                    )
                    .frame(width: 40, height: 40)
                    .background(Color("gray"))
                    .foregroundColor(Color("green"))
                    .clipShape(Circle())
                }
            }
            .padding(.trailing, 10)
        }
        .background(Color("dark_gray"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(width: .infinity, height: 80)
        .padding(.leading, 20)
        .padding(.trailing, 20)
        
//        Label(recipe.macros[0], systemImage: "flame")
//            .font(.subheadline)
//            .frame(width: 340, height: 60)
//            .foregroundColor(Color("white"))
//            .padding(2)
//            .background(Color("green"))
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//    VStack (alignment: .leading) {
//        HStack {
//            Text("Reviews")
//                .font(.title.bold())
//                .padding(.top, 10)
//            Spacer()
//        }
//        ForEach(0..<recipe.preparationSteps.count){ number in
//            VStack(alignment: .leading) {
//                Text(String(number + 1) + ". " + recipe.preparationSteps[number])
//                    .font(.subheadline)
//
//                Rectangle()
//                    .frame(width: .infinity, height: 1)
//            }
//            .foregroundColor(Color("green"))
//            .frame(width: .infinity)
//            Spacer()
//        }
    }
//    .foregroundColor(Color("green"))
//    .padding(.leading, 20)
//    .padding(.trailing, 20)
////            .padding(.top, 10)
////            .padding(.bottom, 10) //zobaczymy czy dodac
//    .frame(width: .infinity)
}

struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails(recipe: recipes[4])
    }
}
