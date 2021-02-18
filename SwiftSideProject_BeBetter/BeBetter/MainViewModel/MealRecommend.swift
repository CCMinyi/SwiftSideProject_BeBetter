//
//  MealRecommend.swift
//  BeBetter
//
//  Created by Minyi on 2021/2/1.
//

import SwiftUI

struct MealRecommend: View {
    
    @State private var _SelectedMealType: Meal.MealType = .muscle
    //var manager = HttpNLP()
    var body: some View {
        ZStack {
            if Goal().manager.SadMood == true{
                Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
                    .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            } else {
                Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
                    .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            VStack(alignment: .center) {
                Text("Meal Recommend")
                    .foregroundColor(.black)
                    .font(.custom("SPShemokmedi", size: 40))
                /*Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
                    .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)*/
                MealTypeView(SelectedMealType: $_SelectedMealType)
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(_SelectedMealType.meals) { meal in
                            MealView(meal: meal)
                        }
                    }
                }
                Spacer()
                
            }.padding()
        }
    }
}

struct MealRecommend_Previews: PreviewProvider {
    static var previews: some View {
        MealRecommend()
    }
}


private extension Meal.MealType {
    
    var meals: [Meal] {
        switch self {
        case .muscle:
            return Meal.muscle
        case .vigorous:
            return Meal.vigorous
        case .lean:
            return Meal.lean
        default:
            return []
        }
    }
    
}

struct MealTypeView: View {
    
    @Binding var SelectedMealType: Meal.MealType
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Meal.MealType.allCases) { MealType in
                    Button(action: {
                        SelectedMealType = MealType
                    }) {
                        VStack {
                            Image(MealType.rawValue)
                                .resizable()
                                .foregroundColor(SelectedMealType == MealType ? .secondaryDark : .darkText)
                                .frame(width: 64, height: 64)
                                .background(SelectedMealType == MealType ? Color.secondaryColor : .clear)
                                .cornerRadius(15)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.lightGrey, lineWidth: 1))
                            Text(MealType.id)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.darkText)
                        }
                    }
                }
            }
            .padding(24)
        }
    }
    
}


struct MealView: View {
    
    let meal: Meal
    
    @State var isFavorite: Bool = false
    
    var body: some View {
        NavigationLink(
            destination: MealDetail()) {
            VStack {
                ZStack(alignment: .topTrailing) {
                    Image(meal.images.first!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .frame(height: 160)
                        .cornerRadius(24.0)
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(.primaryColor)
                            .frame(width: 32, height: 32)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(10)
                    }
                }
                
                
                VStack(spacing: 4) {
                    Text(meal.name)
                        .font(.system(size: 18, weight: .medium))
                }
                .foregroundColor(.darkText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.bottom, 10)
            }
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.lightGrey, lineWidth: 1))
            .padding(.leading)
            .padding(.trailing)
        }
    }
    
}
