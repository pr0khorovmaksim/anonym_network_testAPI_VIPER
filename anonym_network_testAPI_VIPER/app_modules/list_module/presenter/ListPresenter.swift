//
//  ListPresenter.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import Foundation
import UIKit

final class ListPresenter : ViewToListPresenterProtocol {
    
    var view: PresenterToListViewProtocol?
    var router: PresenterToListRouterProtocol?
    var interactor: PresenterToListInteractorProtocol?
    
    func dataFetcher(){
        interactor?.getRequest()
    }
    
    func sortingTap(){
        interactor?.dataSorting()
    }
    
    func sortingDidSelect(indexSort : Int?){
        interactor?.sortingDataProcessing(indexSort: indexSort)
    }
    
    func goToDetail(navigationController : UINavigationController?, list : ItemsList?, indexList : Int?){
        
        router?.showDetailViewController(navigationController: navigationController, list: list, indexList: indexList)
    }
}

extension ListPresenter : InteractorToListPresenterProtocol{
    
    func viewData (list : List?){
        view?.seeData(list: list)
    }
    
    func viewSorting(sortingValueArray : [String]?){
        view?.seeSorting(sortingValueArray: sortingValueArray)
    }
    
    func viewError(errorMessage : String?){
        view?.seeError(errorMessage : errorMessage)
    }
}
