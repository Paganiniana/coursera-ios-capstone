//
//  MenuItemOptionView.swift
//  LittleLemonMenu
//
//  Created by Philip Grabenhorst on 12/17/23.
//

import SwiftUI

struct MenuItemOptionView: View {
    @Environment(\.dismiss) var dismiss;
    
    @Binding var selectedCategory:Array<MenuCategory>;
    @Binding var selectedSort: Sorting;
    
    // @todo bind single-selector for sort,
    // @todo bind multi-selector for section display
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                List {
                    Section(header: Text("Selected Categories")) {
                        Text("Food")
                        Text("Drink")
                        Text("Dessert")
                    }
                }
                List {
                    Section(header: Text("Sort By")) {
                        Text("Most Popular")
                        Text("Price $-$$$")
                        Text("A-Z")
                    }
                }
            }
            .toolbar {
                Button("done") {
                    dismiss()
                }
            }
            .navigationTitle("Filter")
        }
    }

    
    
//    .toolbar {
//        Button("done") {
//            showSettings = false
//        }
//    }
}

#Preview {
    @State var localCategory = [MenuCategory.desert];
    @State var localSort = Sorting.alphabetical;
    
    return MenuItemOptionView(
        selectedCategory: $localCategory,
        selectedSort: $localSort
    )
}
