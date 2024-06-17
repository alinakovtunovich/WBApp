//
//  ToolbarContactsList.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 13.06.2024.
//

import SwiftUI

struct ToolbarContactsList: View {
    var body: some View {
        VStack() {}
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Контакты")
                    .font(.system(size: 18))
                    .bold()
                    .padding()
                Spacer()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "plus")
                        .foregroundColor(Color.primary)
                        .preferredColorScheme(.light)
                        .preferredColorScheme(.dark)
                        .font(.system(size: 18))
                }
                .padding()
            }
        }
    }
}


