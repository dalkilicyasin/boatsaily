//
//  NetworkError.swift
//  boatsaily
//
//  Created by yasin on 16.09.2024.
//

import Foundation

enum NetworkError: Error {
    case noContentReturned
    case decodeFault
    case httpError(statusCode: Int)
    case nonFatal(error: Error)

    var message: String {
        switch self {
        case .noContentReturned, .nonFatal:
            return "An unknown error occured"
        case .httpError(let statusCode):
            return "\(statusCode) Error occured"
        case .decodeFault:
            return "Decode Fault"
        }
    }
}
