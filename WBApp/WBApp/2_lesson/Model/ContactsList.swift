//
//  ContactsList.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 11.06.2024.
//

import Foundation


public struct Contacts: Hashable {
    let id: UUID = UUID()
    let name: String
    var avatar: String?
    var status: Bool
    var story: Bool
    var lastOnline: Date?
}

public var contactSample: [Contacts] = [
    Contacts(name: "Анастасия Иванова", avatar: "anastasiaivanova", status: false, story: false, lastOnline: Date(timeIntervalSinceNow: -86400)),
    Contacts(name: "Петя", avatar: "peter", status: true, story: false),
    Contacts(name: "Маман", avatar: "maman", status: false, story: true, lastOnline: Date(timeIntervalSinceNow: -10800)),
    Contacts(name: "Арбуз Дыня", avatar: "arbuse", status: true, story: false),
    Contacts(name: "Иван Иванов", status: true, story: false),
    Contacts(name: "Лиса Алиса", status: false, story: true, lastOnline: Date(timeIntervalSinceNow: -1800))
]
