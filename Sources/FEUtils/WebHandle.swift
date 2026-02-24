//
//  WebHandle.swift
//  FEUtils
//
//  Created by Maciej on 24/02/2026.
//


import SwiftUI

@available(macOS 26, *)
public struct WebHandle {
 public init(){}
 
 public func get<T: Codable>(urlType: URLType, path: String? = nil) async throws -> T {
  var webService = configure(urlType: urlType, path: path)
  
  return try await webService.get()
 }
 
 public func get<T: Codable>(byId id: Int, urlType: URLType) async throws -> T {
  let url = getURL(type: urlType, params: [id])
  
  var webService = WebService(url: url)
  
  return try await webService.get()
 }
 
 public func put<T: Puttable>(payload: T, urlType: URLType) async throws -> T {
  var webService = configure(urlType: urlType)
  
  return try await webService.put(payload: payload)
 }
 
 public func post<T: Codable>( payload: T, urlType: URLType) async throws -> T {
  var webService = configure(urlType: urlType)
  
  return try await webService.post(payload: payload)
 }
 
 public func delete(urlType: URLType, path: String? = nil) async throws {
  let url = getURL(type: .schedules, path: path)
  
  var webService = WebService(url: url)
  
  return try await webService.basicRequest(method: .delete)
 }
 
 private func configure(urlType: URLType, path: String? = nil) -> WebService {
  let url = getURL(type: urlType, path: path)
  
  return WebService(url: url)
 }
}

@available(macOS 26, *)
public protocol Puttable: Codable, Identifiable {
 var id: Int? { get }
}
