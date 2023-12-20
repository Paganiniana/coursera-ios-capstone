//
//  UserProfile.swift
//  LittleLemonFinal
//
//  Created by Philip Grabenhorst on 12/19/23.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation;
    
    let firstName:String = UserDefaults.standard.string(forKey: kFirstName) ?? "First Name";
    let lastName:String = UserDefaults.standard.string(forKey: kLastName) ?? "Last Name";
    let email:String = UserDefaults.standard.string(forKey: kEmail) ?? "Email";
    
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("Profile")
            Text(firstName);
            Text(lastName);
            Text(email);
            Button("Log Out") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn);
                self.presentation.wrappedValue.dismiss();
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
