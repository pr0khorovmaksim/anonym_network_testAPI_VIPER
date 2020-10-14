//
//  DetailListViewHelper.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 27.09.2020.
//

import Foundation
import UIKit

extension DetailListViewController{
    
    func setupScrollView() {
        
        // MARK: - scrollView
        view.backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.7568627451, blue: 0.7568627451, alpha: 1)
        view.addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        scrollView.addSubview(postView)
        scrollView.addSubview(likeImage)
        scrollView.addSubview(commentsImage)
        scrollView.addSubview(shareImage)
        scrollView.addSubview(vewsImage)
        scrollView.addSubview(postImage)
        
        scrollView.addSubview(textView)
        scrollView.addSubview(viewsLabel)
        scrollView.addSubview(likeCounts)
        scrollView.addSubview(commentsCounts)
        
        scrollView.addSubview(stackView)
        scrollView.addSubview(stackViewStats)
        
        // MARK: - postView
        postView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        postView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        postView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 10).isActive = true
        postView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.95).isActive = true
        
        // MARK: - postImage
        postImage.topAnchor.constraint(equalTo: postView.topAnchor).isActive = true
        postImage.widthAnchor.constraint(equalTo: postView.widthAnchor, multiplier: 1).isActive = true
        postImage.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 0).isActive = true
        postImage.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: 0).isActive = true
        postImage.heightAnchor.constraint(equalTo: postView.heightAnchor, multiplier: 0.5).isActive = true
        
        // MARK: - textView
        textView.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 0).isActive = true
        textView.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 0).isActive = true
        textView.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: 0).isActive = true
        textView.widthAnchor.constraint(equalTo: postView.widthAnchor, multiplier: 1).isActive = true
        
        // MARK: - stackView
        stackView.addArrangedSubview(vewsImage)
        stackView.addArrangedSubview(viewsLabel)
        
        vewsImage.widthAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6).isActive = true
        vewsImage.heightAnchor.constraint(equalTo: vewsImage.widthAnchor, multiplier: 1).isActive = true
        
        viewsLabel.widthAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 1.0).isActive = true
        
        stackView.widthAnchor.constraint(equalTo: postImage.widthAnchor, multiplier: 0.2).isActive = true
        stackView.heightAnchor.constraint(equalTo: postImage.heightAnchor, multiplier: 0.1).isActive = true
        
        stackView.topAnchor.constraint(equalTo: postView.topAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -10).isActive = true
        
        // MARK: - stackViewStats
        stackViewStats.addArrangedSubview(likeImage)
        stackViewStats.addArrangedSubview(likeCounts)
        stackViewStats.addArrangedSubview(commentsImage)
        stackViewStats.addArrangedSubview(commentsCounts)
        stackViewStats.addArrangedSubview(shareImage)
        
        likeImage.widthAnchor.constraint(equalTo: stackViewStats.heightAnchor, multiplier: 0.6).isActive = true
        likeCounts.heightAnchor.constraint(equalTo: stackViewStats.heightAnchor, multiplier: 0.6).isActive = true
        commentsImage.widthAnchor.constraint(equalTo: stackViewStats.heightAnchor, multiplier: 0.6).isActive = true
        commentsCounts.heightAnchor.constraint(equalTo: stackViewStats.heightAnchor, multiplier: 0.6).isActive = true
        shareImage.widthAnchor.constraint(equalTo: stackViewStats.heightAnchor, multiplier: 0.6).isActive = true
        
        likeImage.centerYAnchor.constraint(equalTo: stackViewStats.centerYAnchor).isActive = true
        likeCounts.centerYAnchor.constraint(equalTo: stackViewStats.centerYAnchor).isActive = true
        commentsImage.centerYAnchor.constraint(equalTo: stackViewStats.centerYAnchor).isActive = true
        commentsCounts.centerYAnchor.constraint(equalTo: stackViewStats.centerYAnchor).isActive = true
        shareImage.centerYAnchor.constraint(equalTo: stackViewStats.centerYAnchor).isActive = true
        
        stackViewStats.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 0).isActive = true
        stackViewStats.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stackViewStats.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 0).isActive = true
        stackViewStats.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: 0).isActive = true
    }
}

