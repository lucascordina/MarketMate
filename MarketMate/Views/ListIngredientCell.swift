//
//  ListIngredientCell.swift
//  MarketMate
//
//  Created by Lucas Cordina on 09/04/2018.
//  Copyright © 2018 Lucas Cordina. All rights reserved.
//

import UIKit

class ListIngredientCell: UITableViewCell {

    
    @IBOutlet weak var checkmarkUnchecked: UIImageView!
    @IBOutlet weak var checkmarkChecked: UIImageView!
    @IBOutlet weak var ingredientTitle: UILabel!
    @IBOutlet weak var ingredientAmount: UILabel!
    @IBOutlet weak var recipeIndicator: UIButton!
    @IBOutlet weak var substituteCarat: UIButton!
    
    
    //Data Model
    var ingredient: ListIngredient? {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI(){
        //hide unchecked checkmark if ingredient is checked
        checkmarkUnchecked.isHidden = (ingredient?.isChecked)!
        //show checked checkmark if ingredient is checked
        checkmarkChecked.isHidden = !(ingredient?.isChecked)!
        ingredientTitle.text = ingredient?.title
        ingredientAmount.text = (ingredient?.amount)! + " " + (ingredient?.amountType)!
        recipeIndicator.isHidden = (ingredient?.recipeColor.isEmpty)! ? true: false
        substituteCarat.isHidden = !(ingredient?.hasSubstitute)!
        
        // add strikethrough on checked ingredient
        if(ingredient?.isChecked)!{
            let attributedString = NSMutableAttributedString(string: (ingredient?.title)!)
            attributedString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
            ingredientTitle.attributedText = attributedString
        }

    }
}
