//
//  TextExtention.swift
//  Calendar
//
//  Created by Аlina Кovtunovich on 27.06.2024.
//

import SwiftUI

extension Text {
    struct DateFormatInterpolation: View {
        var date: Date
        var format: DateFormatter.Style
        
        var body: some View {
            Text(verbatim: DateFormatter.localizedString(from: date, dateStyle: format, timeStyle: .none))
        }
    }
    
    func appendInterpolation(date: Date, format: DateFormatter.Style) -> DateFormatInterpolation {
        DateFormatInterpolation(date: date, format: format)
    }
}
