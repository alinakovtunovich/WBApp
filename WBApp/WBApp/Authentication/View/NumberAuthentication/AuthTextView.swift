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
            Text(NSLocalizedString("Enter phone number", comment: ""))
                .font(.system(size: UIConstants.textFontSize))
                .padding(.bottom, 5)
                .foregroundColor(UIConstants.fontColor)
                .bold()
            Text(NSLocalizedString("We will send a confirmation code \nto the number provided", comment: ""))
                .font(.system(size: 14))
                .foregroundColor(UIConstants.fontColor)
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
