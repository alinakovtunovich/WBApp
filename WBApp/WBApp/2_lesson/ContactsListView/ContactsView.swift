//
//  ContactsView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 11.06.2024.
//

import SwiftUI

struct ContactsView: View {
    @State var path = [Contacts]()
    
    var body: some View {

        NavigationStack {
            VStack {
               Searchbar()
                NavigationStack(path: $path) {
                    List(contactSample, id: \.self) { contact in
                        ProfileInList(contact: contact)
                    }
                    .padding(.horizontal, -12)
                    .padding(.vertical, -46)
                    .scrollContentBackground(.hidden)
                    .navigationDestination(for: Contacts.self) { contact in
                        ProfileAccountView(contact: contact)
                    }
                }
            }
            .toolbar {
                ToolbarContactsList()
            }
        }
    }
}


struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
