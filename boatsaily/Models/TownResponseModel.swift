//
//  TownResponseModel.swift
//  boatsaily
//
//  Created by yasin on 7.09.2024.
//

import Foundation

struct TownResponseModel: Codable {
    let Turkey: Cities?
}

struct CitiesTown: Codable {
    let city: String?
    let towns: [String]?
}
