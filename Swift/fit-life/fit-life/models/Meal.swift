//
//  Meal.swift
//  fit-life
//
//  Created by Thiago Durante Pires on 26/11/15.
//  Copyright © 2015 CodingLab. All rights reserved.
//

import Foundation

class Meal {
    
    let name:String
    let happiness:Int
    var items = Array<Item>()
    
    init(name:String, happiness:Int) {
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
}
