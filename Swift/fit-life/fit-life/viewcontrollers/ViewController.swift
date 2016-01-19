//
//  ViewController.swift
//  fit-life
//
//  Created by Thiago Durante Pires on 11/11/15.
//  Copyright © 2015 CodingLab. All rights reserved.
//

import UIKit

protocol AddAMealDelegate {
    func add(meal:Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {

    // O sinal de exclamação serve para dizer que a variável vai ter valor em tempo de execução, ou seja, não precisa ser inicializada neste primeiro momento como é o padrão para propriedades de uma classe
    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinessField:UITextField?
    @IBOutlet var tableView:UITableView?
    
    var delegate:AddAMealDelegate?
    
    var items = [Item(name: "Eggplant Brownie", calories: 10),
                 Item(name: "Zucchini Muffin", calories: 10),
                 Item(name: "Cookie", calories: 10),
                 Item(name: "Coconut Oil", calories: 500),
                 Item(name: "Chocolate Frosting", calories: 1000),
                 Item(name: "Chocolate Chip", calories: 1000)]
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item",
                                            style: UIBarButtonItemStyle.Plain,
                                            target: self,
                                            action: Selector("showNewItem"))
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    func add(item: Item) {
        items.append(item)
        
        if tableView == nil {
            return
        }
        
        tableView!.reloadData()
    }
    
    func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        }
        
    }
    
    var selected = Array<Item>()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if cell == nil {
            return
        }
        
        var item = items[indexPath.row]
        
        if cell!.accessoryType == UITableViewCellAccessoryType.None {
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.append(item)
        } else {
            cell!.accessoryType = UITableViewCellAccessoryType.None
            
            if let position = selected.indexOf(item) {
                selected.removeAtIndex(position)
            }
        }
    }
    
    @IBAction func add() {
        
        if nameField == nil || happinessField == nil {
            return
        }
        
        let name = nameField!.text
        let happiness = Int(happinessField!.text!)!
        
        let meal = Meal(name: name!, happiness: happiness)
        meal.items = selected
        print("name: \(meal.name) happiness: \(meal.happiness) items: \(meal.items)")
        
        if delegate == nil {
            return
        }
        delegate!.add(meal)
        
        // If let faz a verificação se o navigation não é nulo
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }
}

