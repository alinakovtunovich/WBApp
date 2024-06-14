//
//  ProfileInList.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 13.06.2024.
//

import SwiftUI

struct ProfileInList: View {
    let contact: Contacts
    

    
    var body: some View {
        HStack {
            AvatarView(contact: contact)
            VStack(alignment: .leading) {
                Text(contact.name)
                    .bold().font(.system(size: 14))
                    .padding(.vertical, 1)
                Text(contact.status ? "Online" : contact.lastOnline?.lastOnlineAgo() ?? "")
                    .font(.system(size: 12))
                    .foregroundColor(Color.gray)
            }
        }
    }
}

extension Contacts {
    func initials() -> String {
        let words = name.components(separatedBy: " ")
        guard let firstWord = words.first, let lastWord = words.last else {
           return ""
        }
        let firstInitial = String(firstWord.prefix(1))
        let lastInitial = String(lastWord.prefix(1))
        return firstInitial + lastInitial
    }
}

extension Date {
    func lastOnlineAgo() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        switch secondsAgo {
        case 0...3600:
            let minute = secondsAgo / 60
            return "Last seen \(minute) minute\(minute == 1 ? "" : "s") ago"
        default:
            let hours = secondsAgo / 3600
            return "Last seen \(hours) hour\(hours == 1 ? "" : "s") ago"
        }
    }
}

struct ProfileInList_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInList(contact: contactSample[4])
    }
}
