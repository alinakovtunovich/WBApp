//
//  AuthTextView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 11.07.2024.
//

import SwiftUI

struct AuthTextView: View {
    var body: some View {
        Group {
            Text("Введите номер телефона")
                .font(.system(size: 24))
                .padding(.bottom, 5)
                .foregroundColor(Color("fontColor"))
                .bold()
            Text("Мы вышлем код подтверждения \nна указанный номер")
                .font(.system(size: 14))
                .foregroundColor(Color("fontColor"))
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
        }
    }
}


struct AuthTextView_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextView()
    }
}
