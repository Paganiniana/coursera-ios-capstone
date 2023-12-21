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
            ForEach(MenuCategory.allCases, id:\.self) { category in
                Button(action: { setValue(category)}) {
                    Text(category.rawValue)
                        .font(.karla)
                        .frame(maxWidth: .infinity, maxHeight: 30)
                        .background(category == selected ? .gray : .lightGray)
                        .cornerRadius(12)
                }
                .foregroundColor(.black)
            }
        }
        .padding()
    }
    
    func setValue(_ opt: MenuCategory) {
        selected = opt;
    }
}

#Preview {
    @State var localSelected: MenuCategory = .main;
    return MenuSelector(selected: $localSelected);
}
