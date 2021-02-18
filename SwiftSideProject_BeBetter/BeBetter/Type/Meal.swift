//
//  Meal.swift
//  BeBetter
//
//  Created by Minyi on 2021/2/6.
//

import Foundation

struct Meal : Identifiable {
    
    let id:UUID = UUID()
    let name : String
    let type : MealType
    let images:[String]
    
    enum MealType:String,Identifiable,CaseIterable {
        
        var id: String {
            return self.rawValue.capitalized
        }
        
        case muscle,vigorous,lean
    }
    
    static let muscle = [
        Meal(name: "大肌肌菜單", type: .muscle, images: ["肌肉猛男"])
    ]
    static let vigorous = [
        Meal(name: "邁向精實之路", type: .vigorous, images: ["精實美男"])
    ]
    static let lean = [
        Meal(name: "美男養成日記", type: .lean, images: ["斯文帥哥"])
    ]
}
