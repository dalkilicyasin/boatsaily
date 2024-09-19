//
//  HomeRepository.swift
//  boatsaily
//
//  Created by yasin on 16.09.2024.
//

import Foundation

protocol HomeRepository {
    func getCityList(completion: @escaping (Result<CityResponseModel, NetworkError>) -> Void)
}


public struct AnyCodable: Codable {
    public static var stub: Self { AnyCodable() }
}
