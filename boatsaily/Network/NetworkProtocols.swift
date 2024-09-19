//
//  NetworkConfing.swift
//  boatsaily
//
//  Created by yasin on 16.09.2024.
//

import Foundation

import Foundation

/// Types adopting the `NetworkConfigurable` protocol can be used to safely construct `URLRequest`s.
public protocol NetworkConfigurable {

    /// The Base`URL` value for the network call.
    var baseURL: URL { get }

    /// The `[String : String]` dictionary for common headers.
    var headers: [String: String] { get }

    /// The `[String : String]` dictionary for common query params like apiKey, lang etc.
    var queryParameters: [String: String] { get }
    
    var bodyParameters: [String: String] { get }
}

public protocol Requestable {
    var path: String { get }
    var headerParameters: [String: String]? { get }
    var queryParams: [String: String]? { get }
    var bodyParams: [String: String]? { get }
}


private extension Encodable {
    func toDictionary() throws -> [String: Any]? {
        let data = try JSONEncoder().encode(self)
        let jsonData = try JSONSerialization.jsonObject(with: data)
        return jsonData as? [String: Any]
    }
}
