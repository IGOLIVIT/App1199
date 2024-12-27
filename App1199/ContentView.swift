//
//  ContentView.swift
//  App1199
//
//  Created by IGOR on 20/12/2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            HomeView()
        }
    }
}

#Preview {
    ContentView()
}
