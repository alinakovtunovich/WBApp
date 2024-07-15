//
//  UIConstants+Modifier.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 13.07.2024.
//

import SwiftUI

struct UIConstants {
    static let buttonFontSize: CGFloat = 16
    static let buttonWidth: CGFloat = 327
    static let buttonRadius: CGFloat = 30
    static let buttonHeight: CGFloat = 52
    static let buttonCornerRadius: CGFloat = 30
    static let illustrationWidth: CGFloat = 262
    static let illustrationHeight: CGFloat = 271
    static let searchWidth: CGFloat = 262
    static let searchHeight: CGFloat = 36
    static let numberWidth: CGFloat = 57
    static let textFontSize: CGFloat = 24
    static let textWidth: CGFloat = 280
    static let offsetY: CGFloat = 120
    static let userFontSize: CGFloat = 10
    static let userTextWidth: CGFloat = 350
    static let radiusCorner: CGFloat = 4
    static let backgroundAppColor = Color("backgroundColor")
    static let fontButtonColor = Color("fontButtonColor")
    static let brandButtonColor = Color("brandButtonColor")
    static let fontColor = Color("fontColor")
    static let profileDetails = Color("profileDetails")
    static let searchFont = Color("searchFont")
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: UIConstants.buttonFontSize))
            .frame(width: UIConstants.buttonWidth, height: UIConstants.buttonHeight)
            .fontWeight(.bold)
            .foregroundColor(Color("fontButtonColor"))
            .background(Color("brandButtonColor"))
            .cornerRadius(UIConstants.buttonCornerRadius)
            .multilineTextAlignment(.center)
    }
}



extension View {
    func customButtonStyle() -> some View {
        self.modifier(ButtonModifier())
    }
}
