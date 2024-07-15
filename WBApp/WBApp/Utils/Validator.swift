//
//  Validator.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 11.07.2024.
//

import Foundation

struct Validator {
    func isValidPhoneNumber(phoneNumber: String) -> Bool {
        let regex: String = "^[0-9]{3} [0-9]{3}-[0-9]{2}-[0-9]{2}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: phoneNumber)
    }
    
    func formatPhoneNumber(_ number: String) -> String {
        var digits = number.filter { $0.isNumber }
        if digits.count > 10 {
            digits = String(digits.prefix(10))
        }
        
        var formatted = ""
        let parts = [3, 3, 2, 2]
        var index = digits.startIndex
        
        for part in parts {
            if index < digits.endIndex {
                let end = digits.index(index, offsetBy: part, limitedBy: digits.endIndex) ?? digits.endIndex
                formatted += String(digits[index..<end])
                index = end
                if index < digits.endIndex {
                    formatted += (formatted.count >= 6 ? "-" : " ")
                }
            }
        }
        return formatted
    }
}
