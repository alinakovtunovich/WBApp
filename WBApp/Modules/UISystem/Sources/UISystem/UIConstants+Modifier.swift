//
//  UIConstants+Modifier.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 13.07.2024.
//

import SwiftUI

public struct UIConstants {
    public static let buttonFontSize: CGFloat = 16
    public static let buttonWidth: CGFloat = 327
    public static let buttonRadius: CGFloat = 30
    public static let buttonHeight: CGFloat = 52
    public static let buttonCornerRadius: CGFloat = 30
    public static let illustrationWidth: CGFloat = 262
    public static let illustrationHeight: CGFloat = 271
    public static let searchWidth: CGFloat = 262
    public static let searchHeight: CGFloat = 36
    public static let numberWidth: CGFloat = 57
    public static let textFontSize: CGFloat = 24
    public static let smallTextFontSize: CGFloat = 14
    public static let textWidth: CGFloat = 280
    public static let offsetY: CGFloat = 120
    public static let userFontSize: CGFloat = 10
    public static let userTextWidth: CGFloat = 350
    public static let radiusCorner: CGFloat = 4
    public static let codeFontSize: CGFloat = 32
    public static let backgroundAppColor = Color("backgroundColor")
    public static let fontButtonColor = Color("fontButtonColor")
    public static let brandButtonColor = Color("brandButtonColor")
    public static let fontColor = Color("fontColor")
    public static let profileDetails = Color("profileDetails")
    public static let searchFont = Color("searchFont")
}

public struct ButtonModifier: ViewModifier {
    public init() {}
    
    public func body(content: Content) -> some View {
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



