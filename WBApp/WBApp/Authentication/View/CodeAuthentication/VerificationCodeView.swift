//
//  VerificationCodeView.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 15.07.2024.
//

import SwiftUI

struct VerificationCodeView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var code: [String] = ["", "", "", ""]
    @State private var isLoading: Bool = false
    @State var phoneNumber: String
    
    var body: some View {
        VStack {
            Spacer()
            Text("Введите код")
                .font(.system(size: UIConstants.textFontSize))
                .padding(.bottom, 20)
            
            Text("Отправили код на номер \n\(phoneNumber)")
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
            
            HStack(spacing: 15) {
                ForEach(0..<4) { index in
                    TextField("", text: $code[index])
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .frame(width: 50, height: 50)
                        .background(UIConstants.searchFont)
                        .cornerRadius(10)
                        .keyboardType(.numberPad)
                        .onChange(of: code[index]) { _ in
                            if code[index].count > 1 {
                                code[index] = String(code[index].prefix(1))
                            }
                            if !code[index].isEmpty, index < 3 {
                               // доработать
                                UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                            }
                        }
                }
            }
            
            Spacer()
            
            Button(action: {
                // Обработка отправки кода подтверждения
                isLoading = true
                let verificationCode = VerificationCode(phoneNumber: phoneNumber, code: code.joined())
                verifyCode(verificationCode: verificationCode)
            }) {
                if isLoading {
                    ProgressView()
                }
            }
            .padding(.horizontal)
            
            Button(action: {
                // Обработка запроса на повторную отправку кода
            }) {
                Text("Запросить код повторно")
                    .foregroundColor(UIConstants.brandButtonColor)
                    .padding(.top, 20)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    private var backButton: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(UIConstants.fontColor)
        }
    }
    
    private func verifyCode(verificationCode: VerificationCode) {
        // Реализуйте логику обработки кода подтверждения здесь
        // Например, сделайте сетевой запрос для подтверждения кода
    }
}

struct VerificationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeView(phoneNumber: "+7 999 999-99-99")
    }
}

