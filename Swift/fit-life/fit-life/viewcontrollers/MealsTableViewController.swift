//
//  MealsTableViewController.swift
//  fit-life
//
//  Created by Thiago Durante Pires on 30/11/15.
//  Copyright © 2015 CodingLab. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {
    
    var meals = [Meal(name: "Brownie", happiness: 4),
                 Meal(name: "French Fries", happiness: 5),
                 Meal(name: "Muffin", happiness: 3)]
    
    func add(meal:Meal) {
        meals.append(meal)
        tableView.reloadData()
        print("Chamou corretamente")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal" {
            let view:ViewController = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        
        return cell
        
    }
    
    

}
