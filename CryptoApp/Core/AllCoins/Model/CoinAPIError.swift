//
//  CoinAPIError.swift
//  CryptoApp
//
//  Created by luis armendariz on 10/16/23.
//

import Foundation


enum CoinAPIError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    //add custom description to each error case
    var customDescription: String  {
        switch self {
        case .invalidData: return "Invalid data"
        case .jsonParsingFailure: return "Failed to parse JSON"
        case  let .requestFailed(description): return "Request failed: \(description)"
        case let .invalidStatusCode(statusCode): return "Invalid status code: \(statusCode)"
        case let .unknownError(error): return "An unknown error occurred: \(error.localizedDescription)"
        }
    }
}
