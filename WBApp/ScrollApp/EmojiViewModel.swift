//
//  EmojiViewModel.swift
//  ScrollApp
//
//  Created by Аlina Кovtunovich on 02.07.2024.
//

import SwiftUI

class EmojiViewModel: ObservableObject {
    @Published var items: [EmojiItem] = []
    
    init() {
        loadMoreItems()
    }
    
    func loadMoreItems() {
        let newItems = (0..<20).map { _ in
            EmojiItem(emoji: String(UnicodeScalar(Array(0x1F300...0x1F3F0).randomElement()!)!))
        }
        DispatchQueue.main.async {
            self.items.append(contentsOf: newItems)
        }
    }
}
