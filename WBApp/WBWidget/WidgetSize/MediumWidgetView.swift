//
//  MediumWidgetView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 24.06.2024.
//

import SwiftUI
import UIKit

struct MediumWidgetView: View {
    var entry: SimpleEntry
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ForEach(contactSample.filter { $0.status }.prefix(2)) { contact in
                HStack(alignment: .top, spacing: 10) {
                    Link(destination: URL(string: "myapp://profile/\(entry.configuration.contactID ?? "")")!) {
                        ContactAvatarView(contact: contact)
                        VStack(alignment: .leading) {
                            Link(destination: URL(string: "myapp://profile/\(entry.configuration.contactID ?? "")")!) {
                                Text(contact.name)
                                    .bold().font(.system(size: 14))
                                    .foregroundColor(entry.theme == .light ? .black : .white)
                                    .padding(.vertical, 1)
                                Text("Online")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

