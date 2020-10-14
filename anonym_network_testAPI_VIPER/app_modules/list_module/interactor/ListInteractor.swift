//
//  ListInteractor.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import Foundation
import UIKit

final class ListInteractor : PresenterToListInteractorProtocol {
    
    var presenter: InteractorToListPresenterProtocol?
    
    fileprivate let networkDataFetcher : NetworkDataFetcher? = NetworkDataFetcher()
    
    fileprivate var list : List?
    fileprivate var after : String? = ""
    fileprivate var orderBySortValue : String? = "mostPopular"
    fileprivate let sortingValueArray : [String] = ["Набирающие популярность", "Наиболее комментируемые", "Новые"]
    
    func getRequest(){
        
        let first = 20
        var parameters : [String : Any] = [:]
        
        if after == ""{
            parameters =  ["first" : first, "orderBy" : orderBySortValue!]
        }else{
            parameters =  ["first" : first, "after" : after!, "orderBy" : orderBySortValue!]
        }
        
        networkDataFetcher?.fetchList(parameters: parameters) { [self] (result) in
            guard let result = result else { return }
            
            if after == ""{
                self.list = result
                
            }else{
                guard let list = list else { return }
                let item = list.data?.items
                
                guard item != nil else {
                    presenter?.viewError(errorMessage : "\(list.errors![0].orderBy!)")
                    return
                }
                self.list?.data?.items?.append(contentsOf: item!)
            }
            after = result.data?.cursor
            presenter?.viewData(list: list)
        }
    }
    
    func dataSorting(){
        
        presenter?.viewSorting(sortingValueArray: sortingValueArray)
    }
    
    func sortingDataProcessing(indexSort : Int?){
        
        switch sortingValueArray[indexSort!] {
        case "Набирающие популярность":
            self.orderBySortValue = "mostPopular"
        case "Наиболее комментируемые":
            self.orderBySortValue = "mostCommented"
        case "Новые":
            self.orderBySortValue = "createdAt"
        default:
            self.orderBySortValue = "mostPopular"
        }
        
        self.after = ""
        getRequest()
    }
}
