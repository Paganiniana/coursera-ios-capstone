//
//  HeroSection.swift
//  LittleLemonFinal
//
//  Created by Philip Grabenhorst on 12/19/23.
//

import SwiftUI

fileprivate let descriptionText = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
"""

struct HeroSection: View {
    
    @Binding var searchText:String;
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.accentGreen)
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Little Lemon")
                            .font(.markaziTitle1)
                            .foregroundStyle(.lemonYellow)
                            
                        Text("Portland")
                            .font(.markaziTitle2)
                            .foregroundStyle(.white)
                                
                        Text(descriptionText)
                            .font(.karla)
                            .foregroundStyle(.white)
                    }
                    Image("Bruschetta")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                TextField("Search...", text:$searchText)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .background(.white)
                    .cornerRadius(12)
                
            }
            .padding()
        }
        
    }
}

#Preview {
    @State var localSearch:String = "";
    return HeroSection(searchText: $localSearch)
}
