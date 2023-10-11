//
//  NetworkManager.swift
//  SwiftUI-Appetizers
//
//  Created by Tammana on 10/10/23.
//

import Foundation
import SwiftUI

final class NetworkManager {
    static let shared = NetworkManager()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL = baseURL + "appetizers"
    
    var cache = NSCache<NSString, UIImage>()
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
    
    
    func downloadImage(fromURLString urlString : String, completion : @escaping (UIImage?) -> Void){
        //cache Key
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            completion(image)
        }
    
        guard let url = URL(string: urlString) else{
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url : url)) { [self] data, _, _ in
            guard let data = data, let image = UIImage(data: data) else{
                completion(nil)
                return
            }
            cache.setObject(image, forKey: cacheKey)
            completion(image)
            
        
        }
        task.resume()
 
    }
}
