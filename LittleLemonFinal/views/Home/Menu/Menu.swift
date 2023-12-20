//
//  Menu.swift
//  LittleLemonFinal
//
//  Created by Philip Grabenhorst on 12/19/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) var viewContext;
    
    @State var menu: MenuCategory = .dessert;
    @State var searchText: String = "";
    
    
    @ObservedObject var dishesModel = DishesModel();
    
    
    var body: some View {
        VStack {
            HeroSection()
            MenuSelector(selected: $menu)
            FetchedObjects(predicate: getSearchPredicate()) { (dishes: [Dish]) in
                MenuItemList(dishes: dishes);
            }
        }
    }
    
    func getSearchPredicate() -> NSCompoundPredicate {
        var preds: [NSPredicate] = [];
        if (searchText.count > 0) {
            preds.append(NSPredicate(format: "name CONTAINS[cd] %@", searchText))
        }
        preds.append(NSPredicate(format: "category CONTAINS[cd] %@", menu.rawValue))
        
        return NSCompoundPredicate(type: .and, subpredicates: preds)
        
    }
}

#Preview {
    Menu()
}
