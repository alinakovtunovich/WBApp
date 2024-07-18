//
//  PhoneField.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 11.07.2024.
//

import SwiftUI


struct PhoneField: View {
    @Binding var phoneNumber: String
    @Binding var isPhoneValid: Bool
    let validator: Validator

    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: UIConstants.radiusCorner)
                    .frame(width: UIConstants.numberWidth, height: UIConstants.searchHeight)
                    .foregroundColor(UIConstants.profileDetails)
                HStack {
                    Image("flag")
                        .cornerRadius(UIConstants.radiusCorner)
                    Text("+7")
                        .foregroundColor(UIConstants.searchFont)
                        .font(.system(size: 16))
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: UIConstants.radiusCorner)
                    .frame(width: UIConstants.searchWidth, height: UIConstants.searchHeight)
                    .foregroundColor(UIConstants.profileDetails)
                TextField("000 000-00-00", text: $phoneNumber)
                    .keyboardType(.numberPad)
                    .padding()
                    .padding(.leading, 5)
                    .foregroundColor(UIConstants.searchFont)
                    .onChange(of: phoneNumber) { value in
                        phoneNumber = validator.formatPhoneNumber(value)
                        isPhoneValid = validator.isValidPhoneNumber(phoneNumber: phoneNumber)
                    }
            }
        }
        .padding()
        .padding(.horizontal)
    }
}

struct PhoneField_Previews: PreviewProvider {
    static var previews: some View {
        PhoneField(phoneNumber: .constant(""), isPhoneValid: .constant(true), validator: Validator())
    }
}
