//
//  API.swift
//  ClosureAndProtocol
//
//  Created by Hao Kim on 12/29/20.
//

import Foundation

enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
        switch self {
        case .error(let msg):
            return msg
        case .errorURL:
            return "URL string is error"
        }
    }
}

typealias APICompletion<T> = (Result<T, APIError>) -> Void
