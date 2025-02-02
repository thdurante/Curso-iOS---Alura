//
//  Item.swift
//  fit-life
//
//  Created by Thiago Durante Pires on 26/11/15.
//  Copyright © 2015 CodingLab. All rights reserved.
//

import Foundation

class Item : Equatable {
    let name:String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
}

func == (first:Item, second:Item) -> Bool {
    return first.name == second.name && first.calories == second.calories
}
