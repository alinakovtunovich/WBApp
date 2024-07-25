//
//  WalkThroughtScreen.swift
//  WBApp
//
//  Created by Ayrmidon Hagraven on 6/5/24.
//  resave
//

import SwiftUI
import UISystem

struct WalkThroughtScreen: View {
    @State private var startVerification = false
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                UIConstants.backgroundAppColor.edgesIgnoringSafeArea(.all)
                VStack {
                    illustration
                    text
                    firstButton
                    mainButton
                }
                .navigationDestination(isPresented: $startVerification) {
                    ZStack {
                        UIConstants.backgroundAppColor.edgesIgnoringSafeArea(.all)
                        AuthView()
                    }
                }
            }
        }
    }
}

extension WalkThroughtScreen {
    
    var mainButton: some View {
        Button(NSLocalizedString("StartChatting", comment: "")) {
            startVerification = true
        }
        .customButtonStyle()
        .offset(x: 0, y: UIConstants.offsetY)
    }
    
    var illustration: some View {
        Image("Image")
            .resizable()
            .frame(width: UIConstants.illustrationWidth, height: UIConstants.illustrationHeight)
            .offset(x: 0, y: -UIConstants.offsetY)
    }
    
    var text: some View {
        Text(NSLocalizedString("TalkWithFriends", comment: ""))
            .font(.system(size: UIConstants.textFontSize))
            .frame(width: UIConstants.textWidth)
            .fontWeight(.bold)
            .foregroundColor(UIConstants.fontColor)
            .multilineTextAlignment(.center)
            .offset(x: 0, y: -UIConstants.offsetY / 2)
    }

    var firstButton: some View {
            Button(NSLocalizedString("UserAgreement", comment: "")) {}
                .font(.system(size: UIConstants.userFontSize))
                .frame(width: UIConstants.userTextWidth)
                .fontWeight(.bold)
                .foregroundColor(UIConstants.fontColor)
                .multilineTextAlignment(.center)
                .offset(x: 0, y: UIConstants.offsetY - 20)
        }
}

extension View {
    func customButtonStyle() -> some View {
        self.modifier(ButtonModifier())
    }
}


struct WalkThroughtScreen_Previews: PreviewProvider {
    static var previews: some View {
        WalkThroughtScreen()
    }
}

