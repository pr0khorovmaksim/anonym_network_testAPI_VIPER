//
//  DetailListRouter.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import Foundation
import  UIKit

final class DetailListRouter : PresenterToDetailListRouterProtocol{
    
    static func createDetailListModule(list : ItemsList?, indexList : Int?) -> DetailListViewController {
        
        let view = DetailListViewController()
        let presenter : ViewToDetailListPresenterProtocol & InteractorToDetailListPresenterProtocol = DetailListPresenter()
        let router : PresenterToDetailListRouterProtocol = DetailListRouter()
        let interactor : PresenterToDetailListInteractorProtocol = DetailListInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        presenter.list = list
        presenter.indexList = indexList
        
        return view
    }
}
