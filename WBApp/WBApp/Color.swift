//
//  Color.swift
//  WBApp
//
//  Created by Ayrmidon Hagraven on 6/6/24.
//

import SwiftUI

//enum AppColors {
//
//
//    case button = Color(hex: "#9A41FE")
//
//}


extension Color {
    public static var brandButtonColor: Color {
        return Color(UIColor(red: 154/255, green: 65/255, blue: 254/255, alpha: 1.0))
    }
    
    public static var brandPressedColor: Color {
        return Color(UIColor(red: 102/255, green: 14/255, blue: 200/255, alpha: 1.0))
    }
    
    public static var brandDarkModeColor: Color {
        return Color(UIColor(red: 130/255, green: 7/255, blue: 232/255, alpha: 1.0))
    }
    
    public static var brandBackgroundColor: Color {
        return Color(UIColor(red: 236/255, green: 218/255, blue: 255/255, alpha: 1.0))
    }
    
    public static var fontColor: Color {
        return Color(UIColor(red: 41/255, green: 24/255, blue: 59/255, alpha: 1.0))
    }
    
    public static var fontButtonColor: Color {
        return Color(UIColor(red: 247/255, green: 247/255, blue: 252/255, alpha: 1.0))
    }
    
}
