//
//  ContentView.swift
//  SwiftUI-Appetizers
//
//  Created by Tammana on 10/10/23.
//

import SwiftUI

struct AppetizersTabView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersTabView()
    }
}