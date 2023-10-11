//
//  AppetizerListView.swift
//  SwiftUI-Appetizers
//
//  Created by Tammana on 10/10/23.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.appetizers){appetizer in
                    AppetizerListCell(appetizer: appetizer)
                    
                }
                .navigationTitle("🍕 Appetizers")
                
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            
            
            if viewModel.isLoading{
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
        
      
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
