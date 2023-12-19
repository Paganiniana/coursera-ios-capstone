//
//  MenuItemGroup.swift
//  LittleLemonMenu
//
//  Created by Philip Grabenhorst on 12/17/23.
//

import SwiftUI

struct MenuItemGroup: View {
    
    var name:String = "Menu Item Title";
    var menuItems: Array<MenuItem> = [];
    
    var body: some View {
        let rowItem = GridItem()
        let rows = [rowItem, rowItem, rowItem]
            
        VStack(alignment: .leading) {
            Text(name)
                .font(.title2)
                .padding()
            LazyVGrid(columns: rows, content: {
                ForEach(menuItems, id: \.id) { item in
                    NavigationLink {
                        MenuItemDetailsView(item: item)
                            .navigationTitle(item.title)
                    } label: {
                        VStack {
                            Rectangle()
                                .fill(.black)
                                .aspectRatio(contentMode: .fit)
                            Text(item.title)
                                .font(.caption)
                                .foregroundColor(Color.black)

                        }
                    }
                }
            })
            .padding()
        }
    }
}

#Preview {
    MenuItemGroup()
}
