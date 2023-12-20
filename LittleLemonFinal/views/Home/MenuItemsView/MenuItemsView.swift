//
//  MenuItemsView.swift
//  LittleLemonMenu
//
//  Created by Philip Grabenhorst on 12/17/23.
//

import SwiftUI

struct MenuItemsView: View {
    
    @Binding var sectionsToShow:Array<MenuCategory>
    
    let DI = MenuViewViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(sectionsToShow, id: \.self) { section in
                MenuItemGroup(name: section.rawValue, menuItems: DI.getMenuItems(category: section))
            }
        }
    }
}

#Preview {
    @State var sectionsToShow:Array<MenuCategory> = [MenuCategory.desert]
    return MenuItemsView(sectionsToShow: $sectionsToShow)
}
