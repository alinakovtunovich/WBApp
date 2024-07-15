//
//  ContactsList.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 11.06.2024.
//

import Foundation


public struct Contacts: Hashable, Identifiable, Codable {
    public var id: UUID
    let name: String
    var avatar: String?
    var status: Bool
    var story: Bool
    var lastOnline: Date?
}

//public var contactSample: [Contacts] = [
//    Contacts(name: "Анастасия Иванова", avatar: "anastasiaivanova", status: false, story: false, lastOnline: Date(timeIntervalSinceNow: -86400)),
//    Contacts(name: "Петя", avatar: "peter", status: true, story: true),
//    Contacts(name: "Маман", avatar: "maman", status: false, story: true, lastOnline: Date(timeIntervalSinceNow: -10800)),
//    Contacts(name: "Арбуз Дыня", avatar: "arbuse", status: true, story: false),
//    Contacts(name: "Иван Иванов", status: true, story: false),
//    Contacts(name: "Лиса Алиса", status: false, story: true, lastOnline: Date(timeIntervalSinceNow: -1800))
//]

public var contactSample: [Contacts] = [
    Contacts(id: UUID(uuidString: "7B00B537-0479-448A-8F86-7AF43676F1B7")!, name: "Анастасия Иванова", avatar: "anastasiaivanova", status: false, story: false, lastOnline: Date(timeIntervalSinceNow: -86400)),
    Contacts(id: UUID(uuidString: "EE547570-608D-47A5-BF89-56E18BA34309")!, name: "Петя", avatar: "peter", status: true, story: true),
    Contacts(id: UUID(uuidString: "6471E3C9-6733-4836-803C-A0639CA1A40C")!, name: "Маман", avatar: "maman", status: false, story: true, lastOnline: Date(timeIntervalSinceNow: -10800)),
    Contacts(id: UUID(uuidString: "6ED2DDDB-6F8B-4C61-B66A-54A26B495CC7")!, name: "Арбуз Дыня", avatar: "arbuse", status: true, story: false),
    Contacts(id: UUID(uuidString: "79C2D552-04C0-4087-AB5A-5463E6E029C8")!, name: "Иван Иванов", status: true, story: false),
    Contacts(id: UUID(uuidString: "85DA5A54-24C8-4229-8149-DFF8BB931B7C")!, name: "Лиса Алиса", status: false, story: true, lastOnline: Date(timeIntervalSinceNow: -1800))
]


