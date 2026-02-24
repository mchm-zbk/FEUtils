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
 
 public init (url: URL) {
  self.request = URLRequest(url: url)
  self.request.setValue("application/json", forHTTPHeaderField: "Content-Type")
 }
 
 mutating public func get<T: Codable>() async throws -> T {
  request.httpMethod = "GET"
  
  let (data, response) = try await URLSession.shared.data(for: request)
  
  try checkResponse(response: response)
  
  guard
   let decodedResponse = try? JSONDecoder().decode(T.self, from: data)
  else {
   throw NetworkError.failedToDecodeResponse
  }
  
  return decodedResponse
 }
 
 mutating public func post<T: Codable>(payload: T) async throws -> T {
  request.httpMethod = "POST"
  
  guard let encoded = try? JSONEncoder().encode(payload) else {
   throw NetworkError.failedToEncodePayload
  }
  
  let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
  
  try checkResponse(response: response)
  
  guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
   throw NetworkError.failedToDecodeResponse
  }
  
  return decodedResponse
 }
 
 //ToDo: This is basically the same as POST, I have to combine them somehow
 mutating public func put<T: Codable>(payload: T) async throws -> T {
  request.httpMethod = "PUT"
  
  guard let encoded = try? JSONEncoder().encode(payload) else {
   throw NetworkError.failedToEncodePayload
  }
  
  let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
  
  try checkResponse(response: response)
  
  guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
   throw NetworkError.failedToDecodeResponse
  }
  
  return decodedResponse
 }
 
 mutating public func basicRequest(method: ReqMethod) async throws {
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
 
 public enum ReqMethod: String {
  case post = "POST"
  case put = "PUT"
  case delete = "DELETE"
 }
}
