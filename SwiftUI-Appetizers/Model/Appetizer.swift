//
//  Appetizer.swift
//  SwiftUI-Appetizers
//
//  Created by Tammana on 10/10/23.
//

import Foundation

struct Appetizer : Decodable, Identifiable{
    let id : Int?
    let name : String?
    let imageURL : String?
    let description : String?
    let price : Double?
    let calories : Int?
    let carbs : Int?
    let protein : Int?
    
}

struct AppetizerResponse : Decodable{
    let request : [Appetizer]
}

struct MockData {
     static let appetizer = Appetizer(id: 0001, name: "Test Appetizer", imageURL: "", description: "This is the Appetizer description", price: 67.99, calories: 250, carbs: 100, protein: 50)
     static let response : [Appetizer] = [appetizer, appetizer, appetizer, appetizer]
}
