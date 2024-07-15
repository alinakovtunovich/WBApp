//
//  ContactStore.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 23.06.2024.
//

import Foundation

class ContactStore: ObservableObject {
    @Published var selectedContactID: UUID?
}
