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
        
        if (ingredient?.isChecked)! {
            checkmarkUnchecked.isHidden = true
            checkmarkChecked.isHidden = false
        } else {
            checkmarkChecked.isHidden = true
            checkmarkUnchecked.isHidden = false
        }
        
        ingredientTitle.text = ingredient?.title
        ingredientAmount.text = (ingredient?.amount)! + " " + (ingredient?.amountType)!
        recipeIndicator.isHidden = (ingredient?.recipeColor.isEmpty)! ? true: false
        substituteCarat.isHidden = !(ingredient?.hasSubstitute)!
        
        // add strikethrough on checked ingredient
        if(ingredient?.isChecked)!{
            let attributedString = NSMutableAttributedString(string: (ingredient?.title)!)
            attributedString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
            ingredientTitle.attributedText = attributedString
        } else {
            let attributedString = NSMutableAttributedString(string: (ingredient?.title)!)
            attributedString.removeAttribute(NSAttributedStringKey.strikethroughStyle,  range: NSMakeRange(0, attributedString.length))
            ingredientTitle.attributedText = attributedString
        }
        
        let checkmarkCheckedGesture = UITapGestureRecognizer(target: self, action: #selector(ListIngredientCell.checkmarkCheckedTapped(_:)))
        checkmarkCheckedGesture.numberOfTapsRequired = 1
        checkmarkCheckedGesture.numberOfTouchesRequired = 1
        checkmarkChecked.isUserInteractionEnabled = true
        checkmarkChecked.addGestureRecognizer(checkmarkCheckedGesture)

       
        let checkmarkUncheckedGesture = UITapGestureRecognizer(target: self, action: #selector(ListIngredientCell.checkmarkUncheckedTapped(_:)))
        checkmarkUncheckedGesture.numberOfTapsRequired = 1
        checkmarkUncheckedGesture.numberOfTouchesRequired = 1
        checkmarkUnchecked.isUserInteractionEnabled = true
        checkmarkUnchecked.addGestureRecognizer(checkmarkUncheckedGesture)

    }
    
    @objc func checkmarkCheckedTapped(_ sender: UITapGestureRecognizer) {
        ingredient?.isChecked = false
        updateUI()
    }
    
    @objc func checkmarkUncheckedTapped(_ sender: UITapGestureRecognizer) {
        ingredient?.isChecked = true
        updateUI()
    }
}
