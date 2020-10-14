//
//  ListTableViewCell.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import UIKit

final class ListTableViewCell: UITableViewCell {
    
    // MARK: - userPhoto
    let userPhoto : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    // MARK: - threePointsImage
    let threePointsImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "040-settings-1")?.withRenderingMode(.alwaysTemplate)
        img.contentMode = .scaleAspectFill
        img.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return img
    }()
    
    // MARK: - likeImage
    let likeImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "058-like")?.withRenderingMode(.alwaysTemplate)
        img.contentMode = .scaleAspectFill
        img.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return img
    }()
    
    // MARK: - commentsImage
    let commentsImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "042-chat")?.withRenderingMode(.alwaysTemplate)
        img.contentMode = .scaleAspectFill
        img.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return img
    }()
    
    // MARK: - shareImage
    let shareImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "007-share")?.withRenderingMode(.alwaysTemplate)
        img.contentMode = .scaleAspectFill
        img.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return img
    }()
    
    // MARK: - postImage
    let postImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    // MARK: - userName
    let userName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.08
        return label
    }()
    
    // MARK: - postText
    let postText : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 60.0, weight: .regular)
        label.textAlignment = .justified
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.08
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - likeCounts
    let likeCounts : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 25.0, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.08
        label.textColor = .white
        return label
    }()
    
    // MARK: - commentsCounts
    let commentsCounts : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 25.0, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.08
        label.textColor = .white
        return label
    }()
    
    // MARK: - firstStackView
    let firstStackView : UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.layoutMargins = UIEdgeInsets(top: -10, left: 10, bottom: 0, right: 10)
        sv.isLayoutMarginsRelativeArrangement = true
        sv.axis  = .horizontal
        sv.distribution  = .equalSpacing
        sv.alignment = .center
        sv.spacing   = 0
        return sv
    }()
    
    // MARK: - stackViewStats
    let stackViewStats : UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        sv.isLayoutMarginsRelativeArrangement = true
        sv.axis  = .horizontal
        sv.distribution  = .equalSpacing
        sv.alignment = .center
        sv.spacing   = 10.0
        sv.backgroundColor = #colorLiteral(red: 0.4980392157, green: 0.4901960784, blue: 0.4862745098, alpha: 1)
        sv.alpha = 0.8
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(userPhoto)
        contentView.addSubview(threePointsImage)
        contentView.addSubview(likeImage)
        contentView.addSubview(commentsImage)
        contentView.addSubview(shareImage)
        contentView.addSubview(postImage)
        
        contentView.addSubview(userName)
        contentView.addSubview(postText)
        contentView.addSubview(likeCounts)
        contentView.addSubview(commentsCounts)
        
        contentView.addSubview(firstStackView)
        contentView.addSubview(stackViewStats)
        
        // MARK: - firstStackView
        firstStackView.addArrangedSubview(userPhoto)
        firstStackView.addArrangedSubview(userName)
        
        userPhoto.heightAnchor.constraint(equalTo: firstStackView.heightAnchor, multiplier: 1).isActive = true
        userPhoto.leadingAnchor.constraint(equalTo: firstStackView.leadingAnchor, constant: 0).isActive = true
        userPhoto.widthAnchor.constraint(equalTo: firstStackView.heightAnchor, multiplier: 1).isActive = true
        userName.heightAnchor.constraint(equalTo: firstStackView.heightAnchor, multiplier: 0.8).isActive = true
        
        userName.leadingAnchor.constraint(equalTo: userPhoto.trailingAnchor, constant: 10).isActive = true
        
        userPhoto.centerYAnchor.constraint(equalTo: firstStackView.centerYAnchor).isActive = true
        userName.centerYAnchor.constraint(equalTo: firstStackView.centerYAnchor).isActive = true
        
        firstStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        firstStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
        
        firstStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        firstStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        
        // MARK: - threePointsImage
        threePointsImage.widthAnchor.constraint(equalTo: threePointsImage.heightAnchor, multiplier: 1).isActive = true
        threePointsImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
        threePointsImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        threePointsImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        // MARK: - postText
        postText.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 0).isActive = true
        postText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        postText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10).isActive = true
        postText.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95).isActive = true
        postText.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4).isActive = true
        
        // MARK: - postImage
        postImage.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 0).isActive = true
        postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        postImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.55).isActive = true
        
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
        
        stackViewStats.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        stackViewStats.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
        stackViewStats.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 12
        layer.masksToBounds = true
        
        userPhoto.layer.cornerRadius = userPhoto.frame.height / 2
        userPhoto.layer.masksToBounds = true
    }
    
    override public var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 10
            frame.origin.x += 10
            frame.size.height -= 15
            frame.size.width -= 2 * 10
            super.frame = frame
        }
    }
}

