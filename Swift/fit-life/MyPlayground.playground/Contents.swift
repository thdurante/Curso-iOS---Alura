//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground";
str = "Thiago";
print(str);

// O valor não pode ser alterado, é como se fosse uma constante
let constante = "Thiago Durante Pires"

// constante = "something else"

var happiness = 5

func helloCalories(){
    print("Hello callories!")
}

helloCalories()

func add(name:String, callories:Double) {
    print("Name: \(name) callories: \(callories)")
}

add("brownie", callories: 50.5)

let calories:Array<Double> = [100.5, 300, 50.5, 30.6]
let items:Array<Double> = []

for (var i=0; i<calories.count; i++) {
    print(calories[i])
}

// For que vai de 0 até 3 inclusive
for i in 0...3 {
    print(calories[i])
}

for cal in calories{
    print(cal)
}

func allCalories(calories:Array<Double>) ->Double {
    var total:Double = 0
    for c in calories{
        total += c
    }
    return total
}

let totalCalories = allCalories([100, 300.3, 500.4, 200])
print(totalCalories)

// ------------------------------------------------------------------

class Meal {
    
    var name:String
    var happiness:Int
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

class Item {
    var name:String
    var calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}

let brownie = Meal(name: "eggplant brownie",happiness: 5)
brownie.items.append(Item(name: "brownie", calories: 115))
brownie.items.append(Item(name: "vegan cream", calories: 40))

print(brownie.allCalories())





