//
//  SwiftUIView.swift
//  LittleLemonFinal
//
//  Created by Philip Grabenhorst on 12/19/23.
//

import SwiftUI

let kIsLoggedIn = "userLoggedIn"
let kFirstName = "userFirstName"
let kLastName = "userLastName"
let kEmail = "userEmail"

struct Onboarding: View {
    @Environment(\.managedObjectContext) private var viewContext;

    @State var isLoggedIn:Bool = false;
    
    @State var firstName:String = "";
    @State var lastName:String = "";
    @State var email:String = "";
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                VStack {
                    Text("Welcome")
                        .font(.markazi)
                        
                        
                    Image("LogoLarge")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                }
                .foregroundColor(.lemonYellow)
                
                TextField("First Name", text:$firstName)
                TextField("Last Name", text:$lastName)
                TextField("Email", text:$email)
                Button("Perform Registration!") {
                    // make sure fields aren't empty
                    if !firstName.isEmpty && !lastName.isEmpty
                        && !email.isEmpty {
                        // store name & email in UserDefaults
                        UserDefaults.standard.set(firstName, forKey: kFirstName);
                        UserDefaults.standard.set(lastName, forKey: kLastName);
                        UserDefaults.standard.set(email, forKey: kEmail);
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn);
                        
                        // set logged in
                        isLoggedIn = true;
                    }
                }
            }
            .onAppear {
                if (UserDefaults.standard.bool(forKey: kIsLoggedIn)) {
                    isLoggedIn = true
                }
            }
        }
    }
}

#Preview {
    Onboarding()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
