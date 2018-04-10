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
        ListIngredient(title: "Cheese", amount: "2", amountType: "kg", hasSubstitute: true, recipeColor: "blue", isChecked: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set default row height
        self.tableView.rowHeight = 58;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Dairy"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    // indexPath: which section and which row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! ListIngredientCell
        
        
        cell.ingredient = data[indexPath.row]
        
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
