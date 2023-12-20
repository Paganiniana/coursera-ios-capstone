//
//  MenuSelector.swift
//  LittleLemonFinal
//
//  Created by Philip Grabenhorst on 12/19/23.
//

import SwiftUI

struct MenuSelector: View {
    @Binding var selected: MenuCategory;
    
    var body: some View {
        Text("Menu Category Selector")
    }
}

#Preview {
    @State var localSelected: MenuCategory = .main;
    return MenuSelector(selected: $localSelected);
}
