//
//  ProfileAccountView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 13.06.2024.
//

import SwiftUI

struct ProfileAccountView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let contact: Contacts
    var body: some View {
        VStack() {
            Text(contact.name)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 12))
                        .bold()
                        .padding(.leading, 16)
                        .foregroundColor(Color("fontColor"))
                    Text("Профиль")
                        .font(.system(size: 18))
                        .bold()
                        .padding(.leading, 8)
                        .foregroundColor(Color("fontColor"))
                        .padding()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image("coopicon")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .bold()
                    .padding(.trailing, 16)
            }
        }
    }
}

struct ProfileAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAccountView(contact: contactSample[0])
    }
}
