//
//  ContentView.swift
//  LittleLemonMenu
//
//  Created by Philip Grabenhorst on 12/17/23.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        
        TabView {
            Menu()
                .tabItem { Label("Menu", systemImage: "list.dash") }
        }
        .navigationBarBackButtonHidden(true)
        
        
//        NavigationView {
//            MenuItemsView(sectionsToShow: $sectionsToShow)
//                .navigationTitle("Home")
//                .navigationBarTitleDisplayMode(.large)
//                .toolbar {
//                    Button("", systemImage: "slider.horizontal.3") {
//                        showSettings = true
//                    }
//                }
//                .sheet(isPresented: $showSettings){
//                    MenuItemOptionView(
//                        selectedCategory:$sectionsToShow,
//                        selectedSort: $sort
//                    )
//                }
//        }
    }
}

#Preview {
    Home()
}
