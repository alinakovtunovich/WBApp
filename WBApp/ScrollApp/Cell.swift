//
//  Cell.swift
//  ScrollApp
//
//  Created by Аlina Кovtunovich on 02.07.2024.
//

import SwiftUI

struct Cell: View {
    let colors: [Color]
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [12]))
            .foregroundColor(colors[Int.random(in: 0...2)])
    }
}

struct ViewOfCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Cell(colors: [.black, .black, .red])
        }
        
    }
}
