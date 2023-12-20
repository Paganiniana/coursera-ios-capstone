//
//  ContentView.swift
//  LittleLemonMenu
//
//  Created by Philip Grabenhorst on 12/17/23.
//

import SwiftUI

struct Home: View {
    let persistenceController = PersistenceController.shared

    var body: some View {
        
        TabView {
            Menu()
                .tabItem { Label("Menu", systemImage: "list.dash") }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            UserProfile()
                .tabItem { Label("Profile", systemImage: "square.and.pencil") }
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
