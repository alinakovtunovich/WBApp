//
//  WalkThroughtScreen.swift
//  WBApp
//
//  Created by Ayrmidon Hagraven on 6/5/24.
//

import SwiftUI

struct WalkThroughtScreen: View {
    @State private var startVarification = false
    
    var body: some View {
        VStack {
            illustration
            text
            firstButton
            mainButton
        }
        .sheet(isPresented: $startVarification) { VerificationSheetScreen() }
    }
}

extension WalkThroughtScreen {
    
    var mainButton: some View {
        Button("Начать общаться") {
            startVarification = true
        }
            .font(.system(size: 16))
            .frame(width: 327, height: 52)
            .fontWeight(.bold)
            .foregroundColor(Color("fontButtonColor"))
            .background(Color("brandButtonColor"))
            .cornerRadius(30)
            .multilineTextAlignment(.center)
            .offset(x: 0, y: 120)
    }
    
    var illustration: some View {
        Image("Image")
            .resizable()
            .frame(width: 262, height: 271)
            .offset(x: 0, y: -119)
    }
    
    var text: some View {
        Text("Общайтесь с друзьями и близкими легко")
            .font(.system(size: 24))
            .frame(width: 280)
            .fontWeight(.bold)
            .foregroundColor(Color("fontColor"))
            .multilineTextAlignment(.center)
            .offset(x: 0, y: -60)
    }
    
    var firstButton: some View {
        Button("Пользовательское соглашение"){}
            .font(.system(size: 14))
            .frame(width: 280)
            .fontWeight(.bold)
            .foregroundColor(Color("fontColor"))
            .multilineTextAlignment(.center)
            .offset(x: 0, y: 100)
    }
}


struct WalkThroughtScreen_Previews: PreviewProvider {
    static var previews: some View {
        WalkThroughtScreen()
    }
}

