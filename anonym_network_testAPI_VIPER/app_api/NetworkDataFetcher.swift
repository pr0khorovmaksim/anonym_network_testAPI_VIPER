//
//  NetworkDataFetcher.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import Foundation

final class NetworkDataFetcher{
    
    fileprivate let networkService : NetworkService? = NetworkService()
    
    fileprivate let url = "http://stage.apianon.ru:3000/fs-posts/v1/posts"
    fileprivate let httpMethod = "GET"
    
    func fetchList(parameters : [String : Any]?, response: @escaping (List?) -> Void) {
        
        networkService?.request(urlString: url, httpMethod : httpMethod, parameters : parameters ) { (result) in
            
            switch result {
            case .success(let data):
                do {
                    let listes = try JSONDecoder().decode(List.self, from: data)
                    response(listes)
                } catch let jsonError {
                    print("Не удалось декодировать JSON: \(jsonError)")
                    response(nil)
                }
            case .failure(let error):
                print("Ошибка при запросе данных: \(error.localizedDescription)")
                response(nil)
            }
        }
    }
}
