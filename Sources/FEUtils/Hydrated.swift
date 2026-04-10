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
 var hydrationUrl: URL {get}
 var alertManager: AlertManager {get}
 func hydrate() async
}

@available(macOS 26, *)
public extension Hydrated {
 //Without @MainActor alerts were not displayed when errors occured and I had this error in XCode - "Publishing changes from background threads is not allowed; make sure to publish values from the main thread (via operators like receive(on:)) on model updates."
 @MainActor func fetch() async -> FetchedData? {
  do {
   var webService = WebService(url: hydrationUrl)
   
   return try await webService.get()
  } catch {
   alertManager.isPresented = true
   
   return nil
  }
 }
}
