//
//  ContactAvatarView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 24.06.2024.
//

import SwiftUI


struct ContactAvatarView: View {
    let contact: Contacts
    @StateObject private var imageLoader = ImageLoader()

    var body: some View {
        Group {
            if let avatarURL = contact.avatar {
                if let image = imageLoader.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 48, height: 48)
                        .cornerRadius(16)
                        .padding(2)
                        .overlay(StoryOverlay(contact: contact))
                        .overlay(StatusOverlay(contact: contact))
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 48, height: 48)
                        .cornerRadius(16)
                        .padding(2)
                        .overlay(StoryOverlay(contact: contact))
                        .overlay(StatusOverlay(contact: contact))
                        .onAppear {
                            imageLoader.loadImage(from: avatarURL)
                        }
                }
            } else {
                textAvatar(contact: contact)
            }
        }
        .widgetURL(URL(string: "myapp://profile/\(contact.id.uuidString)"))
    }
}
