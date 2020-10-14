//
//  NetworkService.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import Foundation

final class NetworkService{
    
    func request(urlString: String?, httpMethod: String?, parameters : [String : Any]?, completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let urlString = urlString else { return }
        
        var components = URLComponents(string: urlString)!
        var request = URLRequest(url: components.url!)
        
        guard let parameters = parameters else { return }
        guard !parameters.isEmpty else { return }
        
        components.queryItems = [URLQueryItem]()
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = httpMethod
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            completion(.success(data))
        }.resume()
    }
}
