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
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Portland")
            Text(descriptionText)
        }
    }
}

#Preview {
    HeroSection()
}
