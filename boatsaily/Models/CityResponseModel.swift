//
//  CityResponseModel.swift
//  boatsaily
//
//  Created by yasin on 7.09.2024.
//

import Foundation

struct CityResponseModel: Codable {
    let Turkey: Cities?
}

struct Cities: Codable {
    let cities: [String]?
    let cityTowns: [CitiesTown]?
}
