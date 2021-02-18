//
//  MealDetail.swift
//  BeBetter
//
//  Created by Minyi on 2021/2/7.
//

import SwiftUI

struct MealDetail: View {
    //var manager = HttpNLP()
    var body: some View {
        if Goal().manager.SadMood == true{
            Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
                .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        } else {
            Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
                .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MealDetail_Previews: PreviewProvider {
    static var previews: some View {
        MealDetail()
    }
}
