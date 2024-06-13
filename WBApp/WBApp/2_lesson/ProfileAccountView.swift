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
        Text(contact.name)
    }
}

//struct ProfileAccountView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileAccountView(contact: Contacts.self)
//    }
//}
