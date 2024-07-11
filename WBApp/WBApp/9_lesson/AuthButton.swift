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
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("fontColor")))
            } else {
                Text("Продолжить")
                    .font(.system(size: 16))
                    .frame(width: 327, height: 52)
                    .fontWeight(.bold)
                    .foregroundColor(Color("fontButtonColor"))
                    .background(
                        (phoneNumber != "" && isPhoneValid) ?
                        Color("brandButtonColor") :
                            Color("brandButtonColor").opacity(0.2)
                    )
                    .cornerRadius(30)
                    .multilineTextAlignment(.center)
            }
        }
        .disabled( !isPhoneValid || isLoading)
        .animation(.default, value: isLoading)
    }
}


struct AuthButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton(isLoading: .constant(false), phoneNumber: .constant("999 999-99-99"), isPhoneValid: .constant(true))
    }
}
