//
//  CodeField.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 16.07.2024.
//

import SwiftUI

struct CodeField: View {
    @Binding var enteredCode: String
    var verificationCode: VerificationCode
    @Binding var isCodeCorrect: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300, height: 80)
                .foregroundColor(Color.clear)
            
            HStack {
                ForEach(0..<4) { index in
                    Circle()
                        .foregroundColor(enteredCode.count > index ? Color.clear : Color.gray.opacity(0.5))
                        .frame(width: 24, height: 24)
                        .padding(20)
                }
            }
            TextField("", text: Binding(
                get: { self.enteredCode },
                set: { newValue in
                    if newValue.count <= 4 {
                        self.enteredCode = newValue
                        checkCode()
                    }
                }
            ))
            .font(.system(size: UIConstants.codeFontSize))
            .multilineTextAlignment(.leading)
            .frame(width: 235, height: 50)
            .keyboardType(.numberPad)
            .tracking(48)
            .padding(.leading, 15)
        }
    }
    
    private func checkCode() {
        if enteredCode == verificationCode.code {
            isCodeCorrect = true
        }
    }
}

extension TextField {
    func tracking(_ value: CGFloat) -> some View {
        return self.modifier(TrackingModifier(value: value))
    }
}

struct TrackingModifier: ViewModifier {
    var value: CGFloat
    
    func body(content: Content) -> some View {
        content
            .kerning(value)
    }
}

struct CodeField_Previews: PreviewProvider {
    static var previews: some View {
        CodeField(enteredCode: .constant("12"), verificationCode: VerificationCode(phoneNumber: "999 999-99-99", code: "1111"), isCodeCorrect: .constant(false))
    }
}
