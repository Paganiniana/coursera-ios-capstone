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
            HStack(alignment: .top) {
                Image("Profile")
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                VStack(alignment: .leading) {
                    Text("\(firstName) \(lastName)")
                        .font(.karlaSubtitle)
                    Text(email)
                        .font(.karla)
                }
            }
            .frame(alignment: .leading)
            Button(action: logout) {
                Text("Log Out")
                    .font(.karlaBold)
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
