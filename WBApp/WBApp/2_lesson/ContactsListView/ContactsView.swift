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
                    .frame(width: 327, height: 36)
                    .padding(12)
                NavigationStack(path: $path) {
                    switch filteredContacts {
                    case let x where x.isEmpty == false:
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
                        .padding(.top, -25)
                        .padding(.horizontal, -12)
                        .scrollContentBackground(.hidden)
                    default:
                        Text("No contacts found")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    }
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
