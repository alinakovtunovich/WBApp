//
//  LanguagePick.swift
//  Calendar
//
//  Created by Аlina Кovtunovich on 27.06.2024.
//

import Foundation

enum LanguagePick: String, CaseIterable, Identifiable {
    case rus = "🇷🇺"
    case eng = "🇬🇧"
    case fre = "🇫🇷"
    case ger = "🇩🇪"

    var id: LanguagePick { self }
}
