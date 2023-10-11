//
//  NetworkManager.swift
//  SwiftUI-Appetizers
//
//  Created by Tammana on 10/10/23.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL = baseURL + "appetizers"
    private init(){
        
    }
    
    func getAppetizersList(completion : @escaping (Result<[Appetizer], APIError>) -> Void){
        guard let url = URL(string: appetizersURL) else{
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url : url)) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completion(.failure(.invalidURL))
                return
            }
            
            guard let data = data else{
                completion(.failure(.invalidData))
                return
            }
            
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode(AppetizerResponse.self, from: data)
                completion(.success(decodedData.request))
            }
            catch{
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
