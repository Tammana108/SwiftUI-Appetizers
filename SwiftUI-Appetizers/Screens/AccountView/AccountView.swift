//
//  AccountView.swift
//  SwiftUI-Appetizers
//
//  Created by Tammana on 10/10/23.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationStack{
            Text("Account View")
                .navigationTitle("🧾 Account")
        }
       
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
