//
//  ContactsView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 11.06.2024.
//

import SwiftUI

struct ContactsView: View {
    @State var path = [Contacts]()
    @State private var searchText = ""
    
    var filteredContacts: [Contacts] {
        if searchText.isEmpty {
            return contactSample
        } else {
            return contactSample.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                Searchbar(searchText: $searchText)
                NavigationStack(path: $path) {
                    List(filteredContacts) { contact in
                        ProfileInList(contact: contact)
                        .onTapGesture {
                            path.append(contact)
                        }
                        .listRowBackground(Color.clear)
                    }
                    .navigationDestination(for: Contacts.self, destination: { contact in
                        ProfileAccountView(contact: contact)
                        .navigationBarBackButtonHidden()
                    })
                    .padding(.horizontal, -12)
                    .padding(.vertical, -46)
                    .scrollContentBackground(.hidden)
                }
            }
            .background(Color("backgroundColor"))
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
