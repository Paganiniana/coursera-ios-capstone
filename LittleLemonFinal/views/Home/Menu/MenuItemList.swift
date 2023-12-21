//
//  MenuItemList.swift
//  LittleLemonFinal
//
//  Created by Philip Grabenhorst on 12/19/23.
//

import SwiftUI

struct MenuItemList: View {
    
    var dishes: [Dish];
    
    var body: some View {
        List {
            ForEach(dishes) { dish in
                HStack {
                    VStack(alignment: .leading) {
                        Text(dish.name ?? "")
                            .font(.karlaSubtitle)
                        Text(dish.textDescription)
                            .font(.karla)
                        Text(dish.formatPrice())
                            .font(.footnote)
                    }
                    Spacer()
                    AsyncImage(url: URL(string:dish.image ?? "")) { phase in
                        switch phase {
                            case .empty:
                                ProgressView()
                                .frame(minWidth: 100, maxWidth: 100)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(maxWidth: 100, maxHeight: 100)
                        case .failure:
                            Image(systemName: "wifi.slash")
                        }
//                        image.image?.resizable()
//                            .scaledToFit()
                    }
                    .cornerRadius(15)
                }
            }
        }
    }
}

#Preview {
    @State var localMenuList: [Dish] = [];
    
    return MenuItemList(dishes: localMenuList);
}
