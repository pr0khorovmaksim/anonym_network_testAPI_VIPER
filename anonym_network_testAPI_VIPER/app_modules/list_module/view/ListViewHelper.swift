//
//  ListViewHelper.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 27.09.2020.
//

import Foundation
import  UIKit

extension ListViewController{
    
    func configurelList(){
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        sortingOutlet.addTarget(self, action: #selector(sorting), for: .touchUpInside)
        
        headerView.addSubview(sortingOutlet)
        
        sortingOutlet.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        sortingOutlet.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        tableView.tableHeaderView = headerView
        tableView.tableHeaderView?.layoutIfNeeded()
        
        headerView.widthAnchor.constraint(equalTo: tableView.widthAnchor, multiplier: 1).isActive = true
        headerView.heightAnchor.constraint(equalTo: tableView.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    func errorAlert(alertMessage : String?){
        
        let alert = UIAlertController(title: "Внимание, Ошибка!", message: "\(alertMessage!)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
