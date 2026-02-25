//
//  getURL.swift
//  FEUtils
//
//  Created by Maciej on 24/02/2026.
//


import Foundation

public func buildURL(resource:  Resource, path: String? = nil) throws -> URL {
 let host = "http://127.0.0.1:8080"
 
 var urlString = host + resource.rawValue
 
 if let path = path {
  urlString += path
 }
 
 guard let encodedURL = URL(string: urlString) else {
  throw NetworkError.badUrl
 }
 
 return encodedURL
}

public enum Resource: String {
 case lists = "/shoppingLists"
 case categorizedProducts = "/products/categorized"
 case listProducts = "/listProducts"
 case categories = "/categories"
 case products = "/products"
 case recipes = "/recipes"
 case schedules = "/schedules"
}
