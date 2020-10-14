//
//  DetailListProtocols.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import Foundation

protocol ViewToDetailListPresenterProtocol : class {
    
    var view : PresenterToDetailListViewProtocol? { get set }
    var router : PresenterToDetailListRouterProtocol? { get set }
    var interactor : PresenterToDetailListInteractorProtocol? { get set }
    
    var list : ItemsList? { get set }
    var indexList : Int? { get set }
    
    func loadModule()
}

protocol PresenterToDetailListViewProtocol : class {
    func seeData(list: ItemsList?, indexList: Int?)
}

protocol PresenterToDetailListRouterProtocol : class {
    
    static func createDetailListModule(list : ItemsList?, indexList : Int?) -> DetailListViewController
    
}

protocol PresenterToDetailListInteractorProtocol : class {
    
    var presenter : InteractorToDetailListPresenterProtocol? { get set }
    
    func dataProcessing(list : ItemsList?, indexList : Int?)
}

protocol InteractorToDetailListPresenterProtocol : class {
    
    func viewData(list: ItemsList?, indexList: Int?)
}
