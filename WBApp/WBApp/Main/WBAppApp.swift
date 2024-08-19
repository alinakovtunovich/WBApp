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
    @StateObject private var viewModel = ChatExampleViewModel(isOp: true)
    
    var body: some Scene {
        
        WindowGroup {
//             ContentView()
            ContactChatScreen(contact: MockUser(uid: "1", name: "Петя"))
                .environmentObject(viewModel)
//            ContactsMainView()
//                .environmentObject(contactStore)
//                .onOpenURL { url in
//                    handleURL(url)
//                }
        }
    }
    
    private func handleURL(_ url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
        
        if url.scheme == "myapp" {
            if let contactID = components.path.components(separatedBy: "/").last,
               let id = UUID(uuidString: contactID) {
                contactStore.selectedContactID = id
            } else if let queryItems = components.queryItems {
                for queryItem in queryItems {
                    if queryItem.name == "contactID", let contactID = queryItem.value {
                        contactStore.selectedContactID = UUID(uuidString: contactID)
                        break
                    }
                }
            }
        }
    }
}
