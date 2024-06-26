//
//  AvatarView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 14.06.2024.
//

import SwiftUI

struct AvatarView: View {
    let contact: Contacts
    
    var body: some View {
        switch contact.avatar {
        case .some(let imageName):
           Image(imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
                .frame(width: 48, height: 48)
                .cornerRadius(16)
                .padding(2)
                .overlay(StoryOverlay(contact: contact))
                .overlay(StatusOverlay(contact: contact))
        default:
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
}

