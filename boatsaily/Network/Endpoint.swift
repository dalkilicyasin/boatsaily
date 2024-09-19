//
//  Endpoint.swift
//  boatsaily
//
//  Created by yasin on 16.09.2024.
//

import Foundation

final class Endpoint: Requestable {
    var headerParameters: [String : String]?
    
    var queryParams: [String: String]?
    
    var bodyParams: [String: String]?
    
    let path: String
    
    init(path: String,
         headerParameters: [String: String]? = nil,
         queryParams: [String: String]? = nil,
         bodyParams: [String: String]? = nil) {
        self.path = path
        self.headerParameters = headerParameters
        self.queryParams = queryParams
        self.bodyParams = bodyParams
    }
}


