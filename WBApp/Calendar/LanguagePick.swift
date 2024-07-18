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
    case jap = "🇯🇵"

    var id: LanguagePick { self }
    
    func getLocale(for language: LanguagePick) -> Locale {
        switch language {
        case .rus:
            return Locale(identifier: "ru-RU")
        case .eng:
            return Locale(identifier: "en-US")
        case .fre:
            return Locale(identifier: "fr-FR")
        case .ger:
            return Locale(identifier: "de-DE")
        case .jap:
            return Locale(identifier: "ja_JP")
        }
    }
    
    func getDateDescriptions(for language: LanguagePick) -> [String: String] {
        switch language {
        case .rus:
            return ["dayBeforeYesterday": "позавчера",
                    "yesterday": "вчера",
                    "today": "сегодня",
                    "tomorrow": "завтра",
                    "dayAfterTomorrow": "послезавтра"]
        case .eng:
            return ["dayBeforeYesterday": "day before yesterday",
                    "yesterday": "yesterday",
                    "today": "today",
                    "tomorrow": "tomorrow",
                    "dayAfterTomorrow": "day after tomorrow"]
        case .fre:
            return ["dayBeforeYesterday": "avant-hier",
                    "yesterday": "hier",
                    "today": "aujourd'hui",
                    "tomorrow": "demain",
                    "dayAfterTomorrow": "après-demain"]
        case .ger:
            return ["dayBeforeYesterday": "vorgestern",
                    "yesterday": "gestern",
                    "today": "heute",
                    "tomorrow": "morgen",
                    "dayAfterTomorrow": "übermorgen"]
        case .jap:
            return ["dayBeforeYesterday": "一昨日",
                    "yesterday": "昨日",
                    "today": "今日",
                    "tomorrow": "明日",
                    "dayAfterTomorrow": "明後日"]
        }
    }
}
