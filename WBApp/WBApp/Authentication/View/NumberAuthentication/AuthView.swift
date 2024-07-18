//
//  AuthView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 09.07.2024.
//

import SwiftUI

struct AuthView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var phoneNumber: String = ""
    @State private var isLoading: Bool = false
    @State private var isPhoneValid: Bool = false
    @State private var isNavigating: Bool = false
    
    let validator = Validator()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                AuthTextView()
                PhoneField(phoneNumber: $phoneNumber, isPhoneValid: $isPhoneValid, validator: validator)
                if !phoneNumber.isEmpty && !isPhoneValid {
                    Text(NSLocalizedString("Wrong phone number", comment: ""))
                        .foregroundColor(.red)
                        .padding(.top, 5)
                }
                Spacer()
                AuthButton(isLoading: $isLoading, phoneNumber: $phoneNumber, isPhoneValid: $isPhoneValid, isNavigating: $isNavigating)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
            .navigationDestination(isPresented: $isNavigating) {
                VerificationCodeView(verificationCode: VerificationCode(phoneNumber: phoneNumber, code: "1111"))
            }
        }
    }
}

extension AuthView {
    private var backButton: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(UIConstants.fontColor)
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
