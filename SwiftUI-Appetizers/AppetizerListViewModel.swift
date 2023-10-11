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
    
    func getAppetizers(){
        NetworkManager.shared.getAppetizersList{ [self] result in
            DispatchQueue.main.async {
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
