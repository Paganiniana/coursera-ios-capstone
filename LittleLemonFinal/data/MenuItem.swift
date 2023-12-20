//
//  MenuItem.swift
//  LittleLemonMenu
//
//  Created by Philip Grabenhorst on 12/17/23.
//

import Foundation
import CoreData

public struct MenuList: Codable {
    let menu: [MenuItem]
}

public struct MenuItem: Hashable, Codable {
    var id: Int;
    let title: String;
    let price: String;
    let image: String;
    let description: String;
    let category: String;
}

fileprivate let menuTarget = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json";

@MainActor
class DishesModel: ObservableObject {
    @Published var menuItems = [MenuItem]();
    
    func reload(_ coreDataContext: NSManagedObjectContext) async {
        let url = URL(string: menuTarget)!
        let urlSession = URLSession.shared
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let fullMenu = try JSONDecoder().decode(MenuList.self, from: data);
            menuItems = fullMenu.menu;
        
            
            // populate Core Data
            Dish.deleteAll(coreDataContext)
            Dish.createDishesFrom(menuItems:menuItems, coreDataContext)
        }
        catch let DecodingError.dataCorrupted(context) {
            print("We couldn't decode the JSON: \(context.debugDescription)");
        }
        catch let e as NSError {
            print("There was some other problem: \(e.localizedDescription)");
        }
        
    }
}
