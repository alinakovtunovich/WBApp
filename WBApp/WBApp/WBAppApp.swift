//
//  WBAppApp.swift
//  WBApp
//
//  Created by Ayrmidon Hagraven on 6/5/24.
//

import SwiftUI

@main
struct WBAppApp: App {
    @StateObject private var contactStore = ContactStore()
    
    var body: some Scene {
        
        WindowGroup {
//            ContentView()
            ContactsMainView()
                .environmentObject(contactStore)
                .onOpenURL { url in
                    handleURL(url)
                }
        }
    }
    
    private func handleURL(_ url: URL) {
        if url.scheme == "myapp" {
            if let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
               let contactID = components.path.components(separatedBy: "/").last,
               let id = UUID(uuidString: contactID) {
                contactStore.selectedContactID = id
            }
        }
    }
}
