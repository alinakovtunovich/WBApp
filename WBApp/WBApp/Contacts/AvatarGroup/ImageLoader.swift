//
//  ImageLoader.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 30.07.2024.
//

import SwiftUI
import Combine // Фреймворк для работы с асинхронными потоками данных

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    // Свойство для хранения подписки, чтобы её можно было отменить при необходимости
    private var cancellable: AnyCancellable?
    
    func loadImage(from url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
}

