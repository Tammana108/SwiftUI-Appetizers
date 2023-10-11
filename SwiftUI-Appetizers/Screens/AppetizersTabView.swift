//
//  AppetizersTabView.swift
//  SwiftUI-Appetizers
//
//  Created by Tammana on 10/10/23.
//

import SwiftUI

struct AppetizersTabView: View {
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem{
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .tint(Color("AppPrimaryColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersTabView()
            .preferredColorScheme(.light)
    }
}
