//
//  AvatarView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 14.06.2024.
//

import SwiftUI

struct AvatarView: View {
    let contact: Contacts
    let localizationAvatar: String
    
    var body: some View {
        
        switch localizationAvatar {
        case "list":
            switch contact.avatar {
            case .some(let imageName):
               Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
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
        case "profile":
            switch contact.avatar {
            case .some(let imageName):
               Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            default:
                
            ZStack {
                Circle()
                    .fill(Color("profileDetails"))
                    .frame(width: 200, height: 200)

                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 89)
                }
            }
        default:
            VStack {}
        }
    }
}

