//
//  ViewController.swift
//  fit-life
//
//  Created by Thiago Durante Pires on 11/11/15.
//  Copyright © 2015 CodingLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // O sinal de exclamação serve para dizer que a variável vai ter valor em tempo de execução, ou seja, não precisa ser inicializada neste primeiro momento como é o padrão para propriedades de uma classe
    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinessField:UITextField?
    
    @IBAction func add() {
        
        if nameField == nil || happinessField == nil {
            return
        }
        
        let name = nameField!.text
        let happiness = Int(happinessField!.text!)!
        
        let meal = Meal(name: name!, happiness: happiness)
        
        
        
        print("name: \(meal.name) happiness: \(meal.happiness)")
    }


}

