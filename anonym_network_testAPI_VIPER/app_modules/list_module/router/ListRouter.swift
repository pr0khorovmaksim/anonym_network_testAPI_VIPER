//
//  ListRouter.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import Foundation
import UIKit

final class ListRouter : PresenterToListRouterProtocol {
    
    static func createListModule() -> ListViewController {
        
        let view = ListViewController()
        let presenter : ViewToListPresenterProtocol & InteractorToListPresenterProtocol = ListPresenter()
        let router : PresenterToListRouterProtocol = ListRouter()
        let interactor : PresenterToListInteractorProtocol = ListInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func showDetailViewController(navigationController : UINavigationController?, list : ItemsList?, indexList : Int?){
        
        let detailModule = DetailListRouter.createDetailListModule(list : list, indexList : indexList)
        navigationController!.pushViewController(detailModule, animated: true)
        
    }
}
