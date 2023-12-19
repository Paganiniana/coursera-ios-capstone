//
//  SwiftUIView.swift
//  LittleLemonFinal
//
//  Created by Philip Grabenhorst on 12/19/23.
//

import SwiftUI

let kFirstName = "userFirstName"
let kLastName = "userLastName"
let kEmail = "userEmail"

struct Onboarding: View {
    @Environment(\.managedObjectContext) private var viewContext;

    
    @State var firstName:String = "";
    @State var lastName:String = "";
    @State var email:String = "";
    
    
    
    var body: some View {
        VStack {
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
                }
            }
        }
    }
}

#Preview {
    Onboarding()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
