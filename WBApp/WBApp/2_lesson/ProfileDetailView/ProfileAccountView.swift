//
//  ProfileAccountView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 13.06.2024.
//

import SwiftUI

struct ProfileAccountView: View {
    
    let contact: Contacts
    var body: some View {
        ZStack {
            Color("backgroundColor").ignoresSafeArea()
            VStack() {
                AvatarView(contact: contact, localizationAvatar: "profile")
                    .padding(20)
                Text(contact.name)
                    .font(.system(size: 24))
                    .bold()
                Text("+7 999 999-99-99")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                HStack(alignment: .bottom, spacing: 12) {
                    button("X")
                    button("Instagram")
                    button("LinkedIn")
                    button("Facebook")
                }
                .padding(40)
            }
            .padding(.top, -220)
            ToolbarProfile()
        }
    }
    
    func button(_ image: String) -> some View {
        Button(action: {}) {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 17, height: 14)
                        
                }
                .buttonStyle(PlainButtonStyle())
                .background(Color.clear)
                .frame(width: 72, height: 40)
                .overlay(Capsule().stroke(Color("brandButtonColor"), lineWidth: 4))
                .cornerRadius(25)
    }

}

struct ProfileAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAccountView(contact: contactSample[4])
    }
}
