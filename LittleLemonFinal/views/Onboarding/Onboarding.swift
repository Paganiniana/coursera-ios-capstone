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
    
    
    func finishRegistration() {
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
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                VStack {
                    Text("Welcome")
                        .font(.markaziTitle1)
                        
                        
                    Image("LogoLarge")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                    Spacer(minLength: 50)
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 400)
                            .foregroundStyle(.accentGreen)
                        VStack {
                            TextField("First Name", text:$firstName)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 48)
                                .background(.white)
                                .cornerRadius(12)
                            TextField("Last Name", text:$lastName)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 48)
                                .background(.white)
                                .cornerRadius(12)
                            TextField("Email", text:$email)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 48)
                                .background(.white)
                                .cornerRadius(12)
                            Button(action: finishRegistration) {
                                Text("Register")
                                    .frame(maxWidth: .infinity, maxHeight: 48)
                                    .background(.lemonYellow)
                                    .cornerRadius(12)
                            }
                            .foregroundColor(.black)
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()
                }
                .foregroundColor(.lemonYellow)
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
