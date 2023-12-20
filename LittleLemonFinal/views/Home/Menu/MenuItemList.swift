//
//  MenuItemList.swift
//  LittleLemonFinal
//
//  Created by Philip Grabenhorst on 12/19/23.
//

import SwiftUI

struct MenuItemList: View {
    
    var dishes: [Dish];
    
    var body: some View {
        List {
            ForEach(dishes) { dish in
                HStack {
                    Text(dish.name ?? "")
                    Text(dish.textDescription)
                    Text(dish.formatPrice())
//                    AsyncImage(url: URL(string:dish.image ?? ""))
                }
            }
        }
    }
}

#Preview {
    @State var localMenuList: [Dish] = [];
    
    return MenuItemList(dishes: localMenuList);
}
