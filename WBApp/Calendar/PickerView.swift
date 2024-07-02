//
//  PickerView.swift
//  Calendar
//
//  Created by Аlina Кovtunovich on 27.06.2024.
//

import SwiftUI

struct PickerView: View {
    @State private var selectedDate = Date()
    @State private var selectedLanguage: LanguagePick = .eng
    
    var body: some View {
        VStack {
            
            Text("🌍📆").font(.system(size: 100))
            Divider()
            DatePicker(selection: $selectedDate, displayedComponents: .date) {
                Text("Select a date")
                    .font(.title2)
            }
            .datePickerStyle(.compact)
            .padding(30)
            
            Text("Select a language")
                .font(.title2)
            
            Picker("", selection: $selectedLanguage) {
                ForEach(LanguagePick.allCases) { category in
                    Text(category.rawValue).tag(category)
                }
            }
            .pickerStyle(.segmented)
            .padding(20)
            Divider()
            FormattedDatesView(selectedDate: selectedDate, selectedLanguage: selectedLanguage)
                .padding()
            Divider()
        }
    }
}

struct Picker_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
