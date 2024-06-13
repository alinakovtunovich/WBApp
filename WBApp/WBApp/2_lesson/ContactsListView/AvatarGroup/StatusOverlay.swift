//
//  StatusOverlay.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 14.06.2024.
//

import SwiftUI

struct StatusOverlay: View {
    let contact: Contacts
    
    var body: some View {
        Circle()
            .fill(contact.status ? Color.green : Color.clear) // Цвет кружка в зависимости от статуса
            .frame(width: 12, height: 12) // Размер кружка
        
            .offset(x: 20, y: -20) // Позиционирование кружка в правом верхнем углу
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(contact.status ? .white : .clear, lineWidth: 2)
                    .offset(x: 20, y: -20)
            )
    }
}
