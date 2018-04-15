//
//  ListIngredientCell.swift
//  MarketMate
//
//  Created by Lucas Cordina on 09/04/2018.
//  Copyright © 2018 Lucas Cordina. All rights reserved.
//

import UIKit

enum CellPosition {
    case top
    case bottom
    case middle
}

class ListIngredientCell: UITableViewCell {

    
    @IBOutlet weak var checkmarkUnchecked: UIImageView!
    @IBOutlet weak var checkmarkChecked: UIImageView!
    @IBOutlet weak var ingredientTitle: UILabel!
    @IBOutlet weak var ingredientAmount: UILabel!
    @IBOutlet weak var recipeIndicator: UIButton!
    @IBOutlet weak var substituteCarat: UIButton!
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var mainBg: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    var cellPosition: CellPosition = .middle {
        didSet {
            self.updateUI()
        }
    }
    
    //Data Model
    var ingredient: ListIngredient? {
        didSet {
            self.updateUI()
        }
    }
    
    //constraints will be added here to be activated and deactivated.
    //cells are reused by the tableview, thus a top-cell constraint could be repurposed and placed in another cell anywhere in the table
    private var currentConstraints: [NSLayoutConstraint] = []
    
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
        
        self.updateCheckedUI()
        
        self.bindTapEvents()
        
        self.addShadowAndRadius(cellPosition: cellPosition)

    }
    
    private func addShadowAndRadius(cellPosition: CellPosition) {
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.25
        shadowView.layer.shadowRadius = 2.2
        shadowView.layer.shadowOffset = CGSize(width: 0.0,height: 1.0)
        shadowView.layer.masksToBounds = false
        shadowView.backgroundColor = .clear
        
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.deactivate(self.currentConstraints)
        
        if cellPosition == CellPosition.top {
            
            self.currentConstraints = [
                shadowView.bottomAnchor.constraint(equalTo: viewBg.bottomAnchor),
                shadowView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -4)
            ]
            
            //add rounded corner shape and clip it based on superview width and margin
            let bounds = CGRect(x: 0, y: 0, width: self.bounds.width-10, height: self.bounds.height)
            
            let path = UIBezierPath(roundedRect:bounds,
                                    byRoundingCorners:[.topRight, .topLeft],
                                    cornerRadii: CGSize(width: 8, height:  8))

            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            mainBg.layer.mask = maskLayer
            
        } else if cellPosition == CellPosition.bottom {
            
            self.currentConstraints = [
                shadowView.topAnchor.constraint(equalTo: viewBg.topAnchor),
                shadowView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -2)
            ]
            
            
            //add rounded corner shape and clip it based on superview width and margin
            let bounds = CGRect(x: 0, y: 0, width: self.bounds.width-10, height: self.bounds.height)
            let path = UIBezierPath(roundedRect:bounds,
                                    byRoundingCorners:[.bottomRight, .bottomLeft],
                                    cornerRadii: CGSize(width: 8, height:  8))
            
            let maskLayer = CAShapeLayer()
            
            maskLayer.path = path.cgPath
            mainBg.layer.mask = maskLayer
            mainBg.layer.masksToBounds = true
            
        } else {
            
            self.currentConstraints = [
                shadowView.heightAnchor.constraint(equalTo: self.heightAnchor)
            ]
            
            mainBg.layer.mask = nil
        }
        
        NSLayoutConstraint.activate(self.currentConstraints)
    }
    
    private func bindTapEvents() {
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
    
    private func updateCheckedUI() {
        // add/remove strikethrough on check/uncheck ingredient
        if(ingredient?.isChecked)!{
            let attributedString = NSMutableAttributedString(string: (ingredient?.title)!)
            attributedString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
            ingredientTitle.attributedText = attributedString
        } else {
            let attributedString = NSMutableAttributedString(string: (ingredient?.title)!)
            attributedString.removeAttribute(NSAttributedStringKey.strikethroughStyle,  range: NSMakeRange(0, attributedString.length))
            ingredientTitle.attributedText = attributedString
        }
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
