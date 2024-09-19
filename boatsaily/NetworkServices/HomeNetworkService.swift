//
//  HomeNetworkService.swift
//  boatsaily
//
//  Created by yasin on 16.09.2024.
//

import Foundation


final class HomeNetworkService {
    
    private let networkManager: NetworkManagerTemp?
    
    init(networkManager: NetworkManagerTemp? = nil) {
        self.networkManager = networkManager
    }
}


extension HomeNetworkService: HomeRepository {
    func getCityList(completion: @escaping (Result<CityResponseModel, NetworkError>) -> Void) {
        let enpoint = HomeEndPoints.getCityList()
        networkManager?.request(enpoint, type: CityResponseModel.self, method: .get) { result in
            
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.noContentReturned))
            }
           
        }
    }
}
