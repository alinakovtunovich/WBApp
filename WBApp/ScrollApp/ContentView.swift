//
//  ContentView.swift
//  ScrollApp
//
//  Created by Аlina Кovtunovich on 29.06.2024.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var viewModel = EmojiViewModel()
    let colors: [Color] = [Color.black, Color.black, Color.purple]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                Text("Scroll and scroll")
                    .font(.largeTitle).bold()
                    .foregroundColor(.purple)
                Divider()
                ForEach(viewModel.items) { item in
                    CellView(emoji: item.emoji, colors: colors)
                        .padding(30)
                        .onAppear {
                            if item.id == viewModel.items.last?.id {
                                viewModel.loadMoreItems()
                            }
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
