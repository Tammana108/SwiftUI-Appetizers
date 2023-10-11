//
//  APIError.swift
//  SwiftUI-Appetizers
//
//  Created by Tammana on 10/10/23.
//

import Foundation

enum APIError : Error{
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
