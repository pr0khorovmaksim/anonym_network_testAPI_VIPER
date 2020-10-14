//
//  DetailListInteractor.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import Foundation

final class DetailListInteractor : PresenterToDetailListInteractorProtocol {
    
    var presenter: InteractorToDetailListPresenterProtocol?
    
    func dataProcessing(list : ItemsList?, indexList : Int?){
        presenter?.viewData(list: list, indexList: indexList)
    }
    
}
