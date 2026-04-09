//
//  UrlProvider.swift
//  FEUtils
//
//  Created by Maciej on 09/04/2026.
//

import Foundation
import SwiftUI

public class UrlProvider {
 @MainActor public static let shared = UrlProvider()
 
 public var env: Env?
 
 public func getUrl(resource:  Resource, path: String? = nil) -> URL {
  guard let env = env else {
   fatalError("Received nil as env value")
  }
  
  let hostname =
  switch env {
  case .dev:
   "127.0.0.1"
  case .prod:
   "https://hh.mchm.pl:8081"
  }
  
  var urlString = hostname + resource.rawValue
  
  if let path = path {
   urlString += path
  }
  
  return URL(string: urlString)!
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
}

public enum Env {
 case dev
 case prod
}
