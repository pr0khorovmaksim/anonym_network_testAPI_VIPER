//
//  DetailListViewHelper.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 27.09.2020.
//

import Foundation
import UIKit

extension DetailListViewController{
    
    func configureDetailList(){
        
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        likeImage.image = UIImage(named: "058-like")
        commentsImage.image = UIImage(named: "042-chat")
        shareImage.image = UIImage(named: "007-share")
        vewsImage.image = UIImage(named: "069-visual")
        
        likeCounts.font =  UIFont.systemFont(ofSize: 25.0, weight: .regular)
        commentsCounts.font =  UIFont.systemFont(ofSize: 25.0, weight: .regular)
        viewsLabel.font =  UIFont.systemFont(ofSize: 15.0, weight: .regular)
        
        likeCounts.adjustsFontSizeToFitWidth = true
        commentsCounts.adjustsFontSizeToFitWidth = true
        viewsLabel.adjustsFontSizeToFitWidth = true
        
        likeCounts.minimumScaleFactor = 0.08
        commentsCounts.minimumScaleFactor = 0.08
        viewsLabel.minimumScaleFactor = 0.08
        
        vewsImage.image = vewsImage.image?.withRenderingMode(.alwaysTemplate)
        vewsImage.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        viewsLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        stackView.addBackground(color: #colorLiteral(red: 0.4980392157, green: 0.4901960784, blue: 0.4862745098, alpha: 1))
        
        textView.layoutIfNeeded()
        textView.sizeToFit()
        
        self.textViewHeightConstraint.constant = self.textView.contentSize.height
      
        stackView.heightAnchor.constraint(equalToConstant: CGFloat(25)).isActive = true
    
    }
}

