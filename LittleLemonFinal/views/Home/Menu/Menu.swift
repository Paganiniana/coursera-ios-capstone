//
//  Menu.swift
//  LittleLemonFinal
//
//  Created by Philip Grabenhorst on 12/19/23.
//

import SwiftUI

struct Menu: View {
        
    @State var menu: MenuCategory = .food;
    @State var menuItems: [MenuItem] = [];
    
    var body: some View {
        VStack {
            HeroSection()
            MenuSelector(selected: $menu)
            MenuItemList(menuItems: $menuItems);
        }
    }
}

#Preview {
    Menu()
}
