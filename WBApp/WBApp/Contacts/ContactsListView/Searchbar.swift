//
//  Searchbar.swift
//  WBApp
//
//  Created by Аlina Кovtunovich on 13.06.2024.
//

import SwiftUI

struct Searchbar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(10)
                .font(.system(size: 16))
            TextField("Search", text: $searchText)
                .foregroundColor(Color("searchFont"))
            Button(action: {}) {}
        }
        .background(Color("profileDetails"))
        .font(.system(size: 14))
        .cornerRadius(4)
    }
    
}



