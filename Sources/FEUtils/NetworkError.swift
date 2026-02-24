//
//  NetworkError.swift
//  FEUtils
//
//  Created by Maciej on 24/02/2026.
//

public enum NetworkError: Error {
 case badUrl
 case invalidRequest
 case badResponse
 case badStatus
 case failedToDecodeResponse
 case failedToEncodePayload
}
