//
//  MenuItem.swift
//  LittleLemonMenu
//
//  Created by Philip Grabenhorst on 12/17/23.
//

import Foundation


protocol MenuItemProtocol: Identifiable {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var orderCount: Int { get set }
    var ingredients: [Ingredient] { get set }
}

public struct MenuItem: MenuItemProtocol, Hashable {
    public init(title:String, ingredients: [Ingredient]) {
        self.title = title
        self.ingredients = ingredients;
    }
    
    public var id = UUID()
    var price = round(Double.random(in: 0...10) * 100) / 100.0 // initialize with random price
    
    var title: String;
    public func getTitle() -> String {
        return self.title;
    }
    
    
    var orderCount = Int.random(in: 0...1000); // initialize with some number
    
    var ingredients: [Ingredient] = [];
    public func getIngredients() -> [Ingredient] {
        return self.ingredients;
    }
}

public class MenuViewViewModel {
    let foodNames: [String] = ["Pasta", "Chicken Picata", "Burritos", "Chimichangas", "Salad", "BLT Sandwiches", "Dolmades", "Greek Salad", "Bread Bowl", "Chowder", "Fish and Chips", "Grilled Chees"];
    let drinkNames = ["Water", "Tea", "Coffee", "Milk", "Coca Cola", "Pepsi", "Gin & Tonic", "Beer"]
    let desertNames = ["Ice Cream", "Ice Cream Sandwich", "Cheesecake", "Cake"]
    
    public init() {
        
    }
    
    public func getMenuItems(category: MenuCategory) -> [MenuItem] {
        switch category {
            case .drink:
                return getDrinkItems()
            case .food:
                return getFoodItems()
            case .desert:
                return getDesertItems()
        }
    }
    
    func getFoodItems() -> [MenuItem] {
        return foodNames.map {
            MenuItem(
                title:$0,
                ingredients: [
                    Ingredient.allCases.randomElement()!,
                    Ingredient.allCases.randomElement()!,
                    Ingredient.allCases.randomElement()!
                ]
            )
        }
    }

    func getDesertItems() -> [MenuItem] {
        return desertNames.map {
            MenuItem(
                title:$0,
                ingredients: []
            )
        }
    }

    func getDrinkItems() -> [MenuItem] {
        return drinkNames.map {
            MenuItem(
                title:$0,
                ingredients: []
            )
        }
    }

}


