//
//  OrderView.swift
//  SwiftUI-Appetizers
//
//  Created by Tammana on 10/10/23.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationStack{
            Text("Order View")
                .navigationTitle("🍽 Orders")
        }
     
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
