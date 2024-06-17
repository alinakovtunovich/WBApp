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
                    List(contactSample) { contact in
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
