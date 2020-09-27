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
    
    func dataFetcher(after : String?, orderBy : String?){
        interactor?.getRequest(after : after, orderBy : orderBy)
    }
    
    func sortingTap(){
        interactor?.dataSorting()
    }
    
    func goToDetail(navigationController : UINavigationController?, list : List?, indexList : Int?){
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
}
