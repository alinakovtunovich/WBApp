//
//  AuthButton.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 11.07.2024.
//

import SwiftUI

struct AuthButton: View {
    @Binding var isLoading: Bool
    @Binding var phoneNumber: String
    @Binding var isPhoneValid: Bool
    
    var body: some View {
        Button(action: {
            if isPhoneValid {
                withAnimation {
                    isLoading = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation {
                        isLoading = false
                    }
                }
            }
        }) {
            if isLoading && isPhoneValid {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: UIConstants.fontColor))
            } else {
                Text(NSLocalizedString("Continue", comment: ""))
                    .font(.system(size: 16))
                    .frame(width: UIConstants.buttonWidth, height: UIConstants.buttonHeight)
                    .fontWeight(.bold)
                    .foregroundColor(UIConstants.fontButtonColor)
                    .background(
                        (phoneNumber != "" && isPhoneValid) ?
                        UIConstants.brandButtonColor :
                            UIConstants.brandButtonColor.opacity(0.5)
                    )
                    .cornerRadius(UIConstants.buttonRadius)
                    .multilineTextAlignment(.center)
            }
        }
        .disabled( !isPhoneValid || isLoading)
        .animation(.default, value: isLoading)
    }
}


struct AuthButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton(isLoading: .constant(false), phoneNumber: .constant("999 999-99-99"), isPhoneValid: .constant(false))
    }
}
