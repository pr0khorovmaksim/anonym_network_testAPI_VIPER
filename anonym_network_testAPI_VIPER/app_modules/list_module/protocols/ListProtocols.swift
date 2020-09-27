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
 
    func dataFetcher(after : String?, orderBy : String?)
    func sortingTap()
    func goToDetail(navigationController : UINavigationController?, list : List?, indexList : Int?)
}

protocol PresenterToListViewProtocol : class {
    
    func seeData (list : List?)
    func seeSorting(sortingValueArray : [String]?)
}

protocol PresenterToListRouterProtocol : class {
    
    static func createListModule() -> ListViewController
    func showDetailViewController(navigationController : UINavigationController?, list : List?, indexList : Int?)
    
}

protocol PresenterToListInteractorProtocol : class {
    
    var presenter : InteractorToListPresenterProtocol? { get set }
    
    func getRequest(after : String?, orderBy : String?)
    func dataSorting()
}

protocol InteractorToListPresenterProtocol : class {
    
    func viewData (list : List?)
    func viewSorting(sortingValueArray : [String]?)
}
