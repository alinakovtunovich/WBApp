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
    
    @State var selectedTab: Tabs = .user
    
    var body: some View {
        TabView(selection: $selectedTab, content: {
            ContactsView().tabItem {
                Image(selectedTab != .user ? "user" : "userselected")
            }.tag(Tabs.user)
            ContentView().tabItem {
                Image(selectedTab != .communication ? "communication" : "communicationselected")
            }.tag(Tabs.communication)
            ProfileAccountView(contact: contactSample[0]).tabItem {
                Image(selectedTab != .menu ? "menu" : "menuselected")
            }.tag(Tabs.menu)
        })
    }
        
}

struct Contact_TabView_Previews: PreviewProvider {
    static var previews: some View {
        Contact_TabView()
    }
}
