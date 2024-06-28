//
//  ContentView.swift
//  Calendar
//
//  Created by Аlina Кovtunovich on 27.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            PickerView()
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
