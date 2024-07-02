//
//  CellView.swift
//  ScrollApp
//
//  Created by Аlina Кovtunovich on 02.07.2024.
//

import SwiftUI

struct CellView: View {
    let emoji: String
    let colors: [Color]
    let size = CGSize(width: 300, height: 200)
    
    var body: some View {
        ZStack {
            Text(emoji)
                .font(.system(size: 150))
                .opacity(0.2)
            cellSize()
        }
        .frame(width: size.width, height: size.height)
    }
    
    // рандомный выбор расположения ячеек
    private func cellSize() -> some View {
        let parentWidth: CGFloat = 300.0
        let parentHeight: CGFloat = 200.0
        
        switch Int.random(in: 0...6) {
        case 0:
            return AnyView(
                VStack(spacing: 10) {
                    Cell(colors: colors)
                        .frame(width: parentWidth, height: parentHeight / 2)
                    HStack(spacing: 10) {
                        Cell(colors: colors)
                            .frame(width: parentWidth / 2 , height: parentHeight / 2)
                        Cell(colors: colors)
                            .frame(width: parentWidth / 2 , height: parentHeight / 2)
                    }
                }
            )
        case 1:
            return AnyView(
                VStack(spacing: 10) {
                    Cell(colors: colors)
                        .frame(width: parentWidth, height: parentHeight / 3)
                    Cell(colors: colors)
                        .frame(width: parentWidth, height: parentHeight / 3)
                    Cell(colors: colors)
                        .frame(width: parentWidth, height: parentHeight / 3)
                }
            )
        case 2:
            return AnyView(
                HStack(spacing: 10) {
                    Cell(colors: colors)
                        .frame(width: parentWidth / 1.5, height: parentHeight)
                    VStack(spacing: 10) {
                        Cell(colors: colors)
                            .frame(width: parentWidth / 3, height: parentHeight / 2)
                        Cell(colors: colors)
                            .frame(width: parentWidth / 3, height: parentHeight / 2)
                    }
                }
            )
        case 3:
            return AnyView(
                HStack(spacing: 10) {
                    Cell(colors: colors)
                        .frame(width: parentWidth / 3, height: parentHeight)
                    Cell(colors: colors)
                        .frame(width: parentWidth / 3, height: parentHeight)
                    Cell(colors: colors)
                        .frame(width: parentWidth / 3, height: parentHeight)
                }
            )
        case 4:
            return AnyView(
                HStack(spacing: 10) {
                    VStack {
                        Cell(colors: colors)
                            .frame(width: parentWidth / 2, height: parentHeight / 2)
                        Cell(colors: colors)
                            .frame(width: parentWidth / 2, height: parentHeight / 2)
                    }
                   
                    Cell(colors: colors)
                        .frame(width: parentWidth / 2, height: parentHeight)
                }
            )
        case 5:
            return AnyView(
                VStack(spacing: 10) {
                    HStack(spacing: 10) {
                        Cell(colors: colors)
                            .frame(width: parentWidth / 2 , height: parentHeight / 2)
                        Cell(colors: colors)
                            .frame(width: parentWidth / 2 , height: parentHeight / 2)
                    }
                    Cell(colors: colors)
                        .frame(width: parentWidth, height: parentHeight / 2)
                }
            )
        case 6:
            return AnyView(
                HStack(spacing: 10) {
                    Cell(colors: colors)
                        .frame(width: parentWidth / 3, height: parentHeight)
                    VStack(spacing: 10) {
                        Cell(colors: colors)
                            .frame(width: parentWidth / 1.5, height: parentHeight / 2)
                        Cell(colors: colors)
                            .frame(width: parentWidth / 1.5, height: parentHeight / 2)
                    }
                }
            )
        default:
            return AnyView(EmptyView())
        }
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        CellView(emoji: "🥰",  colors: [Color.black, Color.black, Color.blue])
    }
}
