//
//  DetailListPresenter.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import Foundation

final class DetailListPresenter : ViewToDetailListPresenterProtocol{
    
    var view: PresenterToDetailListViewProtocol?
    var router: PresenterToDetailListRouterProtocol?
    var interactor: PresenterToDetailListInteractorProtocol?
    
    var list : ItemsList?
    var indexList : Int?
    
    func loadModule(){
        interactor?.dataProcessing(list: list, indexList: indexList)
    }
}

extension DetailListPresenter : InteractorToDetailListPresenterProtocol {
    
    func viewData(list: ItemsList?, indexList: Int?){
        view?.seeData(list: list, indexList: indexList)
    }
}
