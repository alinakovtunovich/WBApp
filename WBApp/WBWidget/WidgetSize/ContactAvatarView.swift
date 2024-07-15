//
//  ContactAvatarView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 24.06.2024.
//

import SwiftUI


struct ContactAvatarView: View {
    let contact: Contacts

    var body: some View {
        Group {
            if let imageName = contact.avatar {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
                    .cornerRadius(16)
                    .padding(2)
                    .overlay(StoryOverlay(contact: contact))
                    .overlay(StatusOverlay(contact: contact))
            } else {
                Text(contact.initials())
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .frame(width: 48, height: 48)
                    .background(Color("avatarColor"))
                    .cornerRadius(16)
                    .padding(2)
                    .overlay(StoryOverlay(contact: contact))
                    .overlay(StatusOverlay(contact: contact))
            }
        }
        .widgetURL(URL(string: "myapp://profile/\(contact.id.uuidString)"))
    }
}

