//
//  BoatListRepository.swift
//  boatsaily
//
//  Created by yasin on 18.09.2024.
//

import Foundation

protocol BoatListRepository {
    func getBoatList(completion: @escaping (Result<[BoatInformationTempDetailList], NetworkError>) -> Void)
}
