//
//  MainView.swift
//  BeBetter
//
//  Created by Minyi on 2021/1/27.
//

import SwiftUI

struct MainView: View {
    
    
    
    var body: some View {
        TabView{
            CaloriesTracking().tabItem {
                Image(systemName: "doc.text.magnifyingglass")
                Text("Tracking")
                    .foregroundColor(.black)
            }
            MealRecommend().tabItem {
                Image(systemName: "book")
                Text("Meal")
                    .foregroundColor(.black)
            }
            Goal().tabItem{
                Image(systemName: "pencil.and.outline")
                Text("Goal")
                    .foregroundColor(.black)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
