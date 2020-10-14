//
//  ListProtocols.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import Foundation
import UIKit

protocol ViewToListPresenterProtocol : class {
    
    var view : PresenterToListViewProtocol? { get set }
    var router : PresenterToListRouterProtocol? { get set }
    var interactor : PresenterToListInteractorProtocol? { get set }
    
    func dataFetcher()
    func sortingTap()
    func sortingDidSelect(indexSort : Int?)
    func goToDetail(navigationController : UINavigationController?, list : ItemsList?, indexList : Int?)
}

protocol PresenterToListViewProtocol : class {
    
    func seeData (list : List?)
    func seeSorting(sortingValueArray : [String]?)
    func seeError(errorMessage : String?)
}

protocol PresenterToListRouterProtocol : class {
    
    static func createListModule() -> ListViewController
    func showDetailViewController(navigationController : UINavigationController?, list : ItemsList?, indexList : Int?)
}

protocol PresenterToListInteractorProtocol : class {
    
    var presenter : InteractorToListPresenterProtocol? { get set }
    
    func getRequest()
    func dataSorting()
    func sortingDataProcessing(indexSort : Int?)
}

protocol InteractorToListPresenterProtocol : class {
    
    func viewData (list : List?)
    func viewSorting(sortingValueArray : [String]?)
    func viewError(errorMessage : String?)
}
