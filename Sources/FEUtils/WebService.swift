//
//  WebService.swift
//  FEUtils
//
//  Created by Maciej on 24/02/2026.
//

import Foundation

@available(macOS 26, *)
public struct WebService {
 var request: URLRequest
 
 public init (url: URL, alertManager: AlertManager) {
  request = URLRequest(url: url)
  request.setValue("application/json", forHTTPHeaderField: "Content-Type")
 }
 
 mutating public func get<T: Codable>() async throws -> T {
  request.httpMethod = "GET"
  
  let (data, response) = try await URLSession.shared.data(for: request)
  
  try checkResponse(response: response)
  
  return try JSONDecoder().decode(T.self, from: data)
 }
 
 mutating public func upload<T: Codable>(payload: T, httpMethod: HTTPUploadMethod) async throws -> T {
  request.httpMethod = httpMethod.rawValue
  
  guard let encodedPayload = try? JSONEncoder().encode(payload) else {
   throw NetworkError.failedToEncodePayload
  }
  
  let (data, response) = try await URLSession.shared.upload(for: request, from: encodedPayload)
  
  try checkResponse(response: response)
  
  guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
   throw NetworkError.failedToDecodeResponse
  }
  
  return decodedResponse
 }
  
 mutating public func change(method: HTTPMethod) async throws {
  request.httpMethod = method.rawValue
  
  let (_, response) = try await URLSession.shared.data(for: request)
  
  try checkResponse(response: response)
 }
 
 private func checkResponse(response: URLResponse) throws {
  guard
   let response = response as? HTTPURLResponse
  else {
   throw NetworkError.badResponse
  }
  
  guard
   response.statusCode >= 200 && response.statusCode < 300
  else {
   throw NetworkError.badStatus
  }
 }
 
 public enum HTTPMethod: String {
  case post = "POST"
  case put = "PUT"
  case delete = "DELETE"
 }
 
 public enum HTTPUploadMethod: String {
  case post = "POST"
  case put = "PUT"
 }
}

@available(macOS 26, *)
public protocol Puttable: Codable, Identifiable {
 var id: Int? { get }
}
