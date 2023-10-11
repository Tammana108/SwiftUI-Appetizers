//
//  AppetizerListViewModel.swift
//  SwiftUI-Appetizers
//
//  Created by Tammana on 10/10/23.
//

import Foundation

final class AppetizerListViewModel : ObservableObject{
    @Published var appetizers : [Appetizer] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading = false
    
    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizersList{ result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
            
        }
    }
    
    
}
