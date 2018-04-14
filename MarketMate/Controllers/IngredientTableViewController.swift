//
//  DataViewController.swift
//  MarketMate
//
//  Created by Lucas Cordina on 05/04/2018.
//  Copyright © 2018 Lucas Cordina. All rights reserved.
//

import UIKit

class IngredientTableViewController: UITableViewController {
    
    
    var dataObject: String = ""
    //mock
    private var data: [ListIngredient] = [
        ListIngredient(title: "Eggs", amount: "6", amountType: "", hasSubstitute: false, recipeColor: "blue", isChecked: false),
        ListIngredient(title: "Milk", amount: "200", amountType: "ml", hasSubstitute: true, recipeColor: "", isChecked: true),
        ListIngredient(title: "Eggs", amount: "6", amountType: "", hasSubstitute: false, recipeColor: "blue", isChecked: false),
        ListIngredient(title: "Milk", amount: "200", amountType: "ml", hasSubstitute: true, recipeColor: "", isChecked: true),
        ListIngredient(title: "Eggs", amount: "6", amountType: "", hasSubstitute: false, recipeColor: "blue", isChecked: false),
        ListIngredient(title: "Milk", amount: "200", amountType: "ml", hasSubstitute: true, recipeColor: "", isChecked: true),
        ListIngredient(title: "Eggs", amount: "6", amountType: "", hasSubstitute: false, recipeColor: "blue", isChecked: false),
        ListIngredient(title: "Milk", amount: "200", amountType: "ml", hasSubstitute: true, recipeColor: "", isChecked: true),
        ListIngredient(title: "Eggs", amount: "6", amountType: "", hasSubstitute: false, recipeColor: "blue", isChecked: false),
        ListIngredient(title: "Milk", amount: "200", amountType: "ml", hasSubstitute: true, recipeColor: "", isChecked: true),
        ListIngredient(title: "Eggs", amount: "6", amountType: "", hasSubstitute: false, recipeColor: "blue", isChecked: false),
        ListIngredient(title: "Milk", amount: "200", amountType: "ml", hasSubstitute: true, recipeColor: "", isChecked: true),
        ListIngredient(title: "Eggs", amount: "6", amountType: "", hasSubstitute: false, recipeColor: "blue", isChecked: false),
        ListIngredient(title: "Milk", amount: "200", amountType: "ml", hasSubstitute: true, recipeColor: "", isChecked: true),
        ListIngredient(title: "Eggs", amount: "6", amountType: "", hasSubstitute: false, recipeColor: "blue", isChecked: false),
        ListIngredient(title: "Milk", amount: "200", amountType: "ml", hasSubstitute: true, recipeColor: "", isChecked: true),
        ListIngredient(title: "Eggs", amount: "6", amountType: "", hasSubstitute: false, recipeColor: "blue", isChecked: false),
        ListIngredient(title: "Milk", amount: "200", amountType: "ml", hasSubstitute: true, recipeColor: "", isChecked: true),
        ListIngredient(title: "Cheese", amount: "2", amountType: "kg", hasSubstitute: true, recipeColor: "blue", isChecked: false)
    ]
    
    private var categories: [(title: String, ingredientCount: Int)] = [
        ("Dairy", 9),
        ("Meat", 10)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set default row height
        self.tableView.rowHeight = 58;
        self.tableView.showsVerticalScrollIndicator = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 56))
        headerView.backgroundColor = UIColor(named: "lightBackground")
        let label = UILabel()
        label.text = categories[section].title
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.sizeToFit()
        
        //align title with cell content
        label.center.y = headerView.center.y
        label.center.x = 85
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    //allocate cells to category
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories[section].ingredientCount
    }
    
    // set cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! ListIngredientCell
        
        
        cell.ingredient = data[indexPath.row]
        let currentSectionLength = categories[indexPath.section].ingredientCount
        
        //Round out the top corners of the first cell of each section
        if indexPath[1] == 0 {
            let topCornerRadiusPath = UIBezierPath(roundedRect: cell.bounds,
                                                   byRoundingCorners: [.topLeft , .topRight],
                                                   cornerRadii: CGSize(width: 8.0, height: 8.0))
            let topCornerRadiusLayer = CAShapeLayer()
            topCornerRadiusLayer.frame = cell.bounds
            topCornerRadiusLayer.path = topCornerRadiusPath.cgPath
            cell.layer.mask = topCornerRadiusLayer
        } else if indexPath[1] == currentSectionLength-1 { //decreasing current section length by 1 to match the row counts, as the row is 0-index based
            let bottomCornerRadiusPath = UIBezierPath(roundedRect: cell.bounds,
                                                   byRoundingCorners: [.bottomLeft , .bottomRight],
                                                   cornerRadii: CGSize(width: 8.0, height: 8.0))
            let bottomCornerRadiusLayer = CAShapeLayer()
            bottomCornerRadiusLayer.frame = cell.bounds
            bottomCornerRadiusLayer.path = bottomCornerRadiusPath.cgPath
            cell.layer.mask = bottomCornerRadiusLayer
        }

        
        //remove cell highlighting on select
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    // MARK: - Edit Tableview
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //        if editingStyle == UITableViewCellEditingStyle.delete {
        //            let productLine = productLines[indexPath.section]
        //            productLine.products.remove(at: indexPath.row)
        //            // tell the table view to update with new data source
        //            // tableView.reloadData()    Bad way!
        //            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        //        }
    }
    
    
    
    
}
