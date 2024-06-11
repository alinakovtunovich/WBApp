//
//  ContactsView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 11.06.2024.
//

import SwiftUI

struct ContactsView: View {
    @State private var searchText = ""
    @State var path: [Contacts]
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search", text: $searchText)
                    .padding(.leading, 40)
                    .frame(height: 36)
                    .background(Color("fontButtonColor"))
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                    .cornerRadius(4)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading)
                            Spacer()
                        }
                    )
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                //                NavigationStack(path: $path) {
                List(contactaimple, id: \.self) { contact in
                    NavigationLink(contact.name, value: contact)
                }
                
                //                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Контакты")
                        .font(.system(size: 18))
                        .bold()
                        .padding()
                    Spacer()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                    }
                    .padding()
                }
            }
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView(path: contactaimple)
    }
}
