//
//  LargeWidgetView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 24.06.2024.
//

import SwiftUI
import UIKit

struct LargeWidgetView: View {
    var entry: SimpleEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(contactSample.prefix(5)) { contact in
                HStack(alignment: .top, spacing: 10) {
                    Link(destination: URL(string: "myapp://profile/\(entry.configuration.contactID ?? "")")!) {
                        ContactAvatarView(contact: contact)
                        VStack(alignment: .leading) {
                            Link(destination: URL(string: "myapp://profile/\(entry.configuration.contactID ?? "")")!) {
                                Text(contact.name)
                                    .foregroundColor(entry.theme == .light ? .black : .white)
                                    .bold().font(.system(size: 14))
                                .padding(.vertical, 1)}
                            Text(contact.status ? "Online" : contact.lastOnline?.lastOnlineAgo() ?? "")
                                .font(.system(size: 12))
                                .foregroundColor(Color.gray)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

