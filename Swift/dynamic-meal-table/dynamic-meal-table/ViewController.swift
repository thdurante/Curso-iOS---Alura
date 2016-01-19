//
//  ViewController.swift
//  dynamic-meal-table
//
//  Created by Thiago Durante Pires on 29/11/15.
//  Copyright © 2015 CodingLab. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let meals = ["Brownie", "French Fries", "Muffin"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel!.text = meal
        
        return cell
    }
    
}

