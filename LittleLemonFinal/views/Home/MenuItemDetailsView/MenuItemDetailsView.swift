//
//  MenuItemDetailsView.swift
//  LittleLemonMenu
//
//  Created by Philip Grabenhorst on 12/17/23.
//

import SwiftUI

struct MenuItemDetailsView: View {
    
    let item: MenuItem;
    
    var body: some View {
        VStack {
            Image("little-lemon-logo")
                .resizable()
                .scaledToFit()
                .frame(height: 400)
            
            
            Text("Price:")
                .fontWeight(.bold)
            Text(String(item.price))
            
            Text("Ordered:")
                .fontWeight(.bold)
            Text(String(item.orderCount))
            
            Text("Ingredients:")
                .fontWeight(.bold)
            ForEach(item.ingredients, id:\.self) { name in
                Text(name.rawValue)
            }
            if item.ingredients.count == 0{
                Text("Secret Sauce");
            }
        }
        .padding()
    }
}

#Preview {
    let DI = MenuViewViewModel()
    let items = DI.getMenuItems(category: .desert)
    return MenuItemDetailsView(item: items[0])
}
