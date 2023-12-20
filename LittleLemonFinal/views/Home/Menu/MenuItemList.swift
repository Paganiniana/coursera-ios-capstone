//
//  MenuItemList.swift
//  LittleLemonFinal
//
//  Created by Philip Grabenhorst on 12/19/23.
//

import SwiftUI

struct MenuItemList: View {
    
    @Binding var menuItems: [MenuItem];
    
    var body: some View {
        Text("Menu Item List")
    }
}

#Preview {
    @State var localMenuList: [MenuItem] = [];
    
    return MenuItemList(menuItems: $localMenuList);
}
