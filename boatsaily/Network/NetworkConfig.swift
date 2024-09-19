//
//  NetworkConfig.swift
//  boatsaily
//
//  Created by yasin on 16.09.2024.
//

import Foundation

public struct NetworkConfig: NetworkConfigurable {
    public var bodyParameters: [String : String]
    public let baseURL: URL
    public let headers: [String: String]
    public let queryParameters: [String: String]

     public init(baseURL: URL,
                 headers: [String: String] = [:],
                 queryParameters: [String: String] = [:],
                 bodyParameters: [String : String] = [:]) {
        self.baseURL = baseURL
        self.headers = headers
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
    }
}
