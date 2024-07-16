//
//  CodeField.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 16.07.2024.
//

import SwiftUI

struct CodeField: View {
    @Binding var code: String
    @State private var text1: String = ""
    @Binding var isCodeCorrect: Bool
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 250, height: 80)
                .foregroundColor(Color.clear)
            
            HStack {
                ForEach(0..<4) { index in
                    Circle()
                        .foregroundColor(code.count > index ? Color.clear : Color.gray.opacity(0.5))
                        .frame(width: 20, height: 20)
                        .padding(20)
                }
            }
            TextField("", text: Binding(
                get: { self.code },
                set: { newValue in
                    if newValue.count <= 4 {
                        self.code = newValue
                        checkCode()
                    }
                }
            ))
            .font(.largeTitle)
            .multilineTextAlignment(.leading)
            .frame(width: 220, height: 50)
            .keyboardType(.numberPad)
            .tracking(40)
            .padding(.leading, 15)
        }
    }
    private func checkCode() {
        if code == "1111" {
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
        CodeField(code: .constant(""), isCodeCorrect: .constant(false))
    }
}
