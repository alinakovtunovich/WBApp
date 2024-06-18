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
        TextField("Search", text: $searchText)
            .padding(.leading, 40)
            .frame(height: 36)
            .background(Color("profileDetails"))
            .foregroundColor(Color("searchFont"))
            .font(.system(size: 14))
            .cornerRadius(4)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading)
                    Spacer()
                }
            )
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
    }
}


//struct Searchbar_Previews: PreviewProvider {
//    static var previews: some View {
////        Searchbar(searchText: "")
//    }
//}
