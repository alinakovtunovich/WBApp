//
//  FormattedDatesView.swift
//  Calendar
//
//  Created by Аlina Кovtunovich on 28.06.2024.
//

import SwiftUI

struct FormattedDatesView: View {
    var selectedDate: Date
    var selectedLanguage: LanguagePick
    
    var body: some View {
        let locale = selectedLanguage.getLocale(for: selectedLanguage)
        let calendar = Calendar.current
        let dateDescriptions = selectedLanguage.getDateDescriptions(for: selectedLanguage)
        
        let dates = [
            ("\(dateDescriptions["dayBeforeYesterday"]!)", calendar.date(byAdding: .day, value: -2, to: selectedDate)!),
            ("\(dateDescriptions["yesterday"]!)", calendar.date(byAdding: .day, value: -1, to: selectedDate)!),
            ("\(dateDescriptions["today"]!)", selectedDate),
            ("\(dateDescriptions["tomorrow"]!)", calendar.date(byAdding: .day, value: 1, to: selectedDate)!),
            ("\(dateDescriptions["dayAfterTomorrow"]!)", calendar.date(byAdding: .day, value: 2, to: selectedDate)!)
        ]
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        numberFormatter.locale = locale
        

        let formattedDates = dates.map { (description, date) in
            let day = calendar.component(.day, from: date)
            let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .spellOut
                numberFormatter.locale = locale
                let spelledOutDay = numberFormatter.string(from: NSNumber(value: day)) ?? ""
                return (description, "\(spelledOutDay)")
            /*
            // Если нужно добавить локализованное название месяца
            let monthIndex = calendar.component(.month, from: date) - 1
            let monthName = dateFormatter.monthSymbols[monthIndex]
            return (description, "\(spelledOutDay) \(monthName)")
            */
        }

        return VStack(alignment: .leading, spacing: 10) {
            ForEach(0..<formattedDates.count, id: \.self) { index in
                let (description, dateText) = formattedDates[index]
                if calendar.isDate(dates[index].1, inSameDayAs: selectedDate) {
                    Text("\(description): \(dateText)")
                        .font(.title2)
                } else {
                    Text("\(description): \(dateText)")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
