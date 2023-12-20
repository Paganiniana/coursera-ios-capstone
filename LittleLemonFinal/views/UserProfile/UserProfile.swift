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
            HStack {
                Image("Profile")
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                VStack(alignment: .leading) {
                    Text("\(firstName) \(lastName)")
                        .bold()
                    Text(email)
                }
            }
            Button(action: logout) {
                Text("Log Out")
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .background(.lemonYellow)
                    .cornerRadius(12)
            }
            .foregroundColor(.black)
        }
        .frame(alignment:.topLeading)
        .padding()
        
    }
    
    
    
    func logout() {
        UserDefaults.standard.set(false, forKey: kIsLoggedIn);
        self.presentation.wrappedValue.dismiss();
    }
}

#Preview {
    UserProfile()
}
