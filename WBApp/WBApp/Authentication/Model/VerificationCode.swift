//
//  VerificationCode.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 15.07.2024.
//

import Foundation

struct VerificationCode: Identifiable {
    let id = UUID()
    let phoneNumber: String
    let code: String
}
