//
//  NetworkManager.swift
//  boatsaily
//
//  Created by yasin on 7.09.2024.
//

import Foundation
import Alamofire

enum ErrorHandling: Error {
    case serviceFault
    case decodeFault
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init () {
        
    }
    
    func callLocaitonList<T: Codable>(type: T.Type, chosenLocation: String, complation: @escaping(Result<T, ErrorHandling>) -> Void) {
        guard let fileLocation = Bundle.main.url(forResource: "\(chosenLocation)", withExtension: "json") else {return}
        
        do {
            let data = try? Data(contentsOf: fileLocation)
            let result = try JSONDecoder().decode(T.self, from: data!)
            complation(.success(result))
        } catch {
            complation(.failure(ErrorHandling.decodeFault))
        }
    }
    
    func callRealmData<T: Codable>(type: T.Type, url: String, method: HTTPMethod, complation: @escaping(Result<T, ErrorHandling>) -> Void) {
        let filterParameters: [String: Any] = [
            "filter": [
                "city": "İstanbul"  
            ]
        ]
        
        AF.request(url, method: method, parameters: filterParameters).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                complation(.success(data))
            case .failure(_):
                complation(.failure(.decodeFault))
            }
        }
    }
}
