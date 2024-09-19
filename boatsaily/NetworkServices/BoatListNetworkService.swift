//
//  BoatListNetworkService.swift
//  boatsaily
//
//  Created by yasin on 18.09.2024.
//

import Foundation

final class BoatListNetworkService {
    
    private let networkManager: NetworkManagerTemp?
    
    init(networkManager: NetworkManagerTemp? = nil) {
        self.networkManager = networkManager
    }
}


extension BoatListNetworkService: BoatListRepository {
    func getBoatList(completion: @escaping (Result<[BoatInformationTempDetailList], NetworkError>) -> Void) {
        let endPoint = BoatListEndPoints.getBoatList()
        
        networkManager?.request(endPoint, type: [BoatInformationTempDetailList].self, method: .get, complation: { result in
            switch result {
            case .success(let data):
                print("\(data)")
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
