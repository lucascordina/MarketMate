//
//  ListIngredient.swift
//  MarketMate
//
//  Created by Lucas Cordina on 09/04/2018.
//  Copyright © 2018 Lucas Cordina. All rights reserved.
//

import Foundation

class ListIngredient {
    
    init(title: String, amount: String, amountType: String, hasSubstitute: Bool, recipeColor: String, isChecked: Bool){
        self.title = title
        self.amount = amount
        self.amountType = amountType
        self.hasSubstitute = hasSubstitute
        self.recipeColor = recipeColor
        self.isChecked = isChecked
    }
    
    var title: String
    var amount: String
    var amountType: String
    var hasSubstitute: Bool
    var recipeColor: String
    var isChecked: Bool
}
