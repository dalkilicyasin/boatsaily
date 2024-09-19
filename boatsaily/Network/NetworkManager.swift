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

protocol NetworkService {
    func request<T: Codable>(_ endpoint: Endpoint, type: T.Type, method: HTTPMethod, complation: @escaping(Result<T, NetworkError>) -> Void)
}


class NetworkManagerTemp: NetworkService {
    private let config: NetworkConfigurable

    
    init(config: NetworkConfigurable) {
        self.config = config
    }
    
    func request<T: Codable>(_ endpoint: Endpoint, type: T.Type, method: HTTPMethod, complation: @escaping (Result<T, NetworkError>) -> Void){
        
        
        guard let urlRequest = self.urlRequest(with: endpoint) else {
            return
        }
        
        var request = urlRequest
        
        request.httpMethod = method.rawValue
        
        do {
            if let bodyParams = endpoint.bodyParams {
                request.httpBody = try JSONSerialization.data(withJSONObject: bodyParams)
            }else {
                request.httpBody = nil
            }
        } catch {
            print("JSON Serilaztion failed \(error.localizedDescription)")
        }
       
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                complation(.failure(.nonFatal(error: error)))
            }
            
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode){
                complation(.failure(.httpError(statusCode: httpResponse.statusCode)))
            }
            
            
            if let data = data {
                self.handleResponse(data: data) { response in
                    complation(response)
                }
            }
        }.resume()
        
      
    }
    
    
    private func handleResponse<T: Codable>(data: Data, completion: @escaping(Result<T, NetworkError>) -> ()) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.decodeFault))
        }
    }
    
    private func urlRequest(with endpoint: Endpoint) -> URLRequest? {
        var urlComponents = URLComponents(string: config.baseURL.absoluteString)
        urlComponents?.path = "/\(endpoint.path)"

        if let queryParams = endpoint.queryParams {
            urlComponents?.setQueryItems(with: queryParams)
        }
        
        guard let url = urlComponents?.url else {
            return nil
        }

        return URLRequest(url: url)
    }
}

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
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



