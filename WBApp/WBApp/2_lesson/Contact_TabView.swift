//
//  Contact_TabView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 17.06.2024.
//

import SwiftUI

enum Tabs: Hashable {
    case heart
    case broke
    case game
}

struct Contact_TabView: View {
    
    @State var selectedTab: Tabs = .heart
    
    var body: some View {
        TabView(selection: $selectedTab, content: {
            ContactsView().tabItem {
                Image("user")
                    .resizable()
                    .frame(width: 10, height: 10)
            }.tag(Tabs.heart)
            ContentView().tabItem {
                Image("communication")
                    .resizable()
                    .frame(width: 21, height: 5)
            }.tag(Tabs.game)
            ContentView().tabItem {
                Image("menu")
                    .resizable()
                    .frame(width: 21, height: 5)
            }.tag(Tabs.broke)
        })

    }
}

struct Contact_TabView_Previews: PreviewProvider {
    static var previews: some View {
        Contact_TabView()
    }
}
