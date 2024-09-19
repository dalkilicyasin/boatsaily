//
//  BoatSailyAppConfiguration.swift
//  boatsaily
//
//  Created by yasin on 16.09.2024.
//

import Foundation

public enum AppConfiguration: String {
    case baseURL = "https://eu-central-1.aws.data.mongodb-api.com"
}

//TODO: scheme dan ayarlanıcak ayarlar aşşağıda 

public enum  BoatSailyAppConfiguration: String {
    case debug
    case release
    case tempUAt 
    
    
    public static let current1: BoatSailyAppConfiguration = {
        guard let rawValue = Bundle.main.infoDictionary?["Configuration"] as? String else {
            fatalError("No Configuration Found")
            //return .debug
        }

        guard let configuration = BoatSailyAppConfiguration(rawValue: rawValue.lowercased()) else {
            fatalError("Invalid Configuration")
        }

        return configuration
    }()
    
    // TODO: will add configuration
    public var apiBaseURL: URL {
        switch self {
        case .debug:
            return URL(string: "https://eu-central-1.aws.data.mongodb-api.com/app/data-ovpatrg/endpoint")!
        case .release:
            return URL(string: "https://eu-central-1.aws.data.mongodb-api.com/app/data-ovpatrg/endpoint")!
        case .tempUAt:
            return URL(string: "https://eu-central-1.aws.data.mongodb-api.com/app/data-ovpatrg/endpoint")!
        }
    }
    
    
    static func apiBaseURL(_ chosenConfig: BoatSailyAppConfiguration) -> URL {
        switch chosenConfig {
        case .tempUAt:
            return URL(string: "https://eu-central-1.aws.data.mongodb-api.com/app/data-ovpatrg/endpoint")!
        case .release:
            return URL(string: "https://eu-central-1.aws.data.mongodb-api.com/app/data-ovpatrg/endpoint")!
        case .debug:
            return URL(string: "https://eu-central-1.aws.data.mongodb-api.com/app/data-ovpatrg/endpoint")!
        }
    }
    
}





