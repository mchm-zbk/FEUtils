//
//  Hydrated.swift
//  FEUtils
//
//  Created by Maciej on 07/03/2026.
//

import Foundation

@available(macOS 26, *)
public protocol Hydrated {
 associatedtype FetchedData: Codable
 var hydrationUrl: URL {get set}
 var alertManager: AlertManager {get}
 func hydrate() async
}

@available(macOS 26, *)
public extension Hydrated {
 func fetch() async -> FetchedData? {
  do {
   var webService = WebService(url: hydrationUrl)
   
   return try await webService.get()
  } catch {
   alertManager.isPresented = true
   
   return nil
  }
 }
}
