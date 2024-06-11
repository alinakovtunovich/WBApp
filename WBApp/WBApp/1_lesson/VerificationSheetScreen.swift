//
//  VerificationSheetScreen.swift
//  WBApp
//
//  Created by Ayrmidon Hagraven on 6/6/24.
//

import SwiftUI

struct VerificationSheetScreen: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            Color("backgroundColor").edgesIgnoringSafeArea(.all)
            Button("Close") {
               dismiss()
            }
                .font(.system(size: 16))
                .frame(width: 327, height: 52)
                .fontWeight(.bold)
                .foregroundColor(Color("fontButtonColor"))
                .background(Color("brandButtonColor"))
                .cornerRadius(30)
                .multilineTextAlignment(.center)
        }
    }
}

struct VerificationSheetScreen_Previews: PreviewProvider {
    static var previews: some View {
        VerificationSheetScreen()
    }
}
