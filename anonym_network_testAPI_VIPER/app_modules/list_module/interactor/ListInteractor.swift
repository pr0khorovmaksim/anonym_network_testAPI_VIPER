//
//  ListInteractor.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import Foundation

final class ListInteractor : PresenterToListInteractorProtocol {
    
    var presenter: InteractorToListPresenterProtocol?
    
    fileprivate let networkDataFetcher : NetworkDataFetcher? = NetworkDataFetcher()
    fileprivate var list : List?
    
    func getRequest(after : String?, orderBy : String?){
        
        var parameters : [String : Any] = [:]
        let first = 20
        
        if after == "" || orderBy == ""{
            
            if after == ""{
                parameters = ["first" : first]
            }else{
                parameters = ["first" : first, "after" : "\(after!)"]
            }
            
            if orderBy == ""{
                parameters = ["first" : first]
            }else{
                parameters = ["first" : first, "orderBy" : "\(orderBy!)"]
            }
            
            if after == "" && orderBy == ""{
                parameters = ["first" : first]
            }else{
                parameters = ["first" : first, "after" : "\(after!)", "orderBy" : "\(orderBy!)"]
            }
            
        }else{
            parameters = ["first" : first, "after" : "\(after!)", "orderBy" : "\(orderBy!)"]
        }
        
        let url = "http://stage.apianon.ru:3000/fs-posts/v1/posts"
        
        networkDataFetcher?.fetchList(urlString: url, httpMethod: "GET", parameters: parameters) { [self] (result) in
            guard let result = result else { return }
            list = result
            presenter?.viewData(list: result)
            
        }
    }
    
    func dataSorting(){
        let sortingValueArray = ["Набирающие популярность", "Наиболее комментируемые", "Новые"]
        presenter?.viewSorting(sortingValueArray: sortingValueArray)
    }
}
