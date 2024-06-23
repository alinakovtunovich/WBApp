//
//  Contact_TabView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 17.06.2024.
//

import SwiftUI

enum Tabs: Hashable {
    case user
    case communication
    case menu
}

struct Contact_TabView: View {
    @EnvironmentObject var contactStore: ContactStore
    @State private var internalSelectedTab: Tabs = .user
    
    private var chosenContactID: Int? {
        if let chosenContact = contactStore.selectedContactID {
            if let result = contactSample.firstIndex(where: { contact in
                return contact.id == chosenContact
            }) {
                return result
            } else {
                return nil
            }
        }
        return nil
    }
    
    private var selectedTab: Binding<Tabs> {
        Binding(
            get: {
                if self.chosenContactID != nil {
                    return .menu
                } else {
                    return .user
                }
            },
            set: {
                self.internalSelectedTab = $0
            }
        )
    }
 
    var body: some View {
        TabView(selection: selectedTab) {
            ContactsView().tabItem {
                Image(internalSelectedTab != .user ? "user" : "userselected")
            }.tag(Tabs.user)
            ContentView().tabItem {
                Image(internalSelectedTab != .communication ? "communication" : "communicationselected")
            }.tag(Tabs.communication)
            if let chosenContactIndex = chosenContactID {
                ProfileAccountView(contact: contactSample[chosenContactIndex]).tabItem {
                    Image(internalSelectedTab != .menu ? "menu" : "menuselected")
                }.tag(Tabs.menu)
            } else {
                ProfileAccountView(contact: contactSample[0]).tabItem {
                    Image(internalSelectedTab != .menu ? "menu" : "menuselected")
                }.tag(Tabs.menu)
            }
        }
    }
}

struct Contact_TabView_Previews: PreviewProvider {
    static var previews: some View {
        Contact_TabView()
    }
}

