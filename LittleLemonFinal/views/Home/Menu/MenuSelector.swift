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
        HStack {
            Button(action: { setValue(.main)}) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.lightGray)
                    Text(MenuCategory.main.rawValue)
                }
                .frame(minWidth: .infinity, minHeight: 30)
            }
//            .frame(minWidth: .infinity, minHeight: 30)
//            Spacer()
//            Button(MenuCategory.starter.rawValue) {
//                selected = MenuCategory.dessert;
//            }
//            Spacer()
//            Button(MenuCategory.dessert.rawValue) {
//                selected = MenuCategory.dessert;
//            }
        }
        padding()
    }
    
    func setValue(_ opt: MenuCategory) {
        selected = opt;
    }
}

#Preview {
    @State var localSelected: MenuCategory = .main;
    return MenuSelector(selected: $localSelected);
}
