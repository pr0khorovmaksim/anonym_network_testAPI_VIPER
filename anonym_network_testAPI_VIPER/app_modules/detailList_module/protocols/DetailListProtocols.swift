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
    
    var list : List? { get set }
    var indexList : Int? { get set }
    
    func loadModule()
}

protocol PresenterToDetailListViewProtocol : class {
    func seeData(list: List?, indexList: Int?)
}

protocol PresenterToDetailListRouterProtocol : class {
    
    static func createDetailListModule(list : List?, indexList : Int?) -> DetailListViewController
    
}

protocol PresenterToDetailListInteractorProtocol : class {
    
    var presenter : InteractorToDetailListPresenterProtocol? { get set }
    
    func dataProcessing(list : List?, indexList : Int?)
}

protocol InteractorToDetailListPresenterProtocol : class {
    
    func viewData(list: List?, indexList: Int?)
}
