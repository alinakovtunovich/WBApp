//
//  PickerView.swift
//  Calendar
//
//  Created by Аlina Кovtunovich on 27.06.2024.
//

import SwiftUI

struct PickerView: View {
    @State private var selectedDate = Date()
    @State private var selectedLanguage: LanguagePick = .rus
    
    var body: some View {
        VStack {
            
            DatePicker(selection: $selectedDate, displayedComponents: .date) {
                Text("Select a date")
                    .font(.title)
            }
            .datePickerStyle(.compact)
            .padding(40)
            
            Text("Select a language")
                .font(.title)
            
            Picker("", selection: $selectedLanguage) {
                ForEach(LanguagePick.allCases) { category in
                    Text(category.rawValue).tag(category)
                }
            }
            .pickerStyle(.segmented)
            .padding(20)
            
        }
    }
}

struct Picker_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
