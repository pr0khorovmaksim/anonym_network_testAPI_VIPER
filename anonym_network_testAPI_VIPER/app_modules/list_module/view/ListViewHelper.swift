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
        
        tableView.backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.7568627451, blue: 0.7568627451, alpha: 1)
        headerView.backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.7568627451, blue: 0.7568627451, alpha: 1)
        
        sortingOutlet.backgroundColor = #colorLiteral(red: 1, green: 0.5137254902, blue: 0.5137254902, alpha: 1)
        sortingOutlet.titleLabel?.font =  UIFont.systemFont(ofSize: 20.0, weight: .regular)
        sortingOutlet.titleLabel?.numberOfLines = 1
        sortingOutlet.titleLabel?.adjustsFontSizeToFitWidth = true
        sortingOutlet.titleLabel?.minimumScaleFactor = 0.08
        sortingOutlet.tintColor = .white
        
        sortingOutlet.layer.cornerRadius = sortingOutlet.bounds.size.height/2
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.widthAnchor.constraint(equalTo: self.tableView.widthAnchor, multiplier: 1).isActive = true
        headerView.heightAnchor.constraint(equalTo: self.tableView.heightAnchor, multiplier: 0.1).isActive = true
     
        self.tableView.tableHeaderView = headerView
        self.tableView.tableHeaderView?.layoutIfNeeded()
        
    }
    
    func errorAlert(alertMessage : String?){
        
        let alert = UIAlertController(title: "Внимание, Ошибка!", message: "\(alertMessage!)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
