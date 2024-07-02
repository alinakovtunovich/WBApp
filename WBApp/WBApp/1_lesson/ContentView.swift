//
//  ContentView.swift
//  WBApp
//
//  Created by Ayrmidon Hagraven on 6/5/24.
//  resave
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("backgroundColor").edgesIgnoringSafeArea(.all)
            WalkThroughtScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()    
    }
}
