//
//  SmallWidgetView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 24.06.2024.
//

import SwiftUI
import UIKit

struct SmallWidgetView: View {
    var entry: SimpleEntry
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
            ForEach(contactSample.filter { $0.status }.prefix(4)) { contact in
                Link(destination: URL(string: "myapp://profile/\(entry.configuration.contactID ?? "")")!) {
                    ContactAvatarView(contact: contact)
                }
            }
        }
    }
}

