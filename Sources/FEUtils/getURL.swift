//
//  getURL.swift
//  FEUtils
//
//  Created by Maciej on 24/02/2026.
//


import Foundation

func getURL(type: URLType, path: String? = nil, params: [Int]? = nil) -> URL {
 let host = "http://127.0.0.1:8080"
 
 var urlString = host + type.rawValue
 
 if let path = path {
  urlString += path
 }
 
 if let params = params {
  for param in params {
   urlString += "/\(param)"
  }
 }
 
 //ToDo: Fix this force unwrapping
 return URL(string: urlString)!
}

public enum URLType: String {
 case lists = "/shoppingLists"
 case categorizedProducts = "/products/categorized"
 case listProducts = "/listProducts"
 case categories = "/categories"
 case products = "/products"
 case recipes = "/recipes"
 case schedules = "/schedules"
}
