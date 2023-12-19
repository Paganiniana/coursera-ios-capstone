//
//  ContentView.swift
//  LittleLemonMenu
//
//  Created by Philip Grabenhorst on 12/17/23.
//

import SwiftUI

struct Menu: View {
    @State var showSettings: Bool = false;
    
    @State var sort:Sorting = .alphabetical;
    @State var sectionsToShow:[MenuCategory] = [.food, .drink, .desert];
    
    
    var body: some View {
        NavigationView {
            MenuItemsView(sectionsToShow: $sectionsToShow)
                .navigationTitle("Menu")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    Button("", systemImage: "slider.horizontal.3") {
                        showSettings = true
                    }
                }
                .sheet(isPresented: $showSettings){
                    MenuItemOptionView(
                        selectedCategory:$sectionsToShow,
                        selectedSort: $sort
                    )
                }
        }
    }
}

#Preview {
    Menu()
}
