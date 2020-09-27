//
//  ListTableViewCell.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var threePointsImage: UIImageView!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var commentsImage: UIImageView!
    @IBOutlet weak var shareImage: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var likeCounts: UILabel!
    @IBOutlet weak var commentsCounts: UILabel!
    
    @IBOutlet weak var firstStackView: UIStackView!
    @IBOutlet weak var stackViewStats: UIStackView!
    
    @IBOutlet weak var firstSVHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        firstStackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        firstStackView.isLayoutMarginsRelativeArrangement = true
        
        threePointsImage.contentMode = .scaleAspectFit
        likeImage.contentMode = .scaleAspectFit
        commentsImage.contentMode = .scaleAspectFit
        shareImage.contentMode = .scaleAspectFit
        
        stackViewStats.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        stackViewStats.isLayoutMarginsRelativeArrangement = true
        
        likeCounts.textColor = .white
        commentsCounts.textColor = .white
        
        postImage.contentMode = .scaleAspectFill
        userPhoto.contentMode = .scaleAspectFill
        
        layer.cornerRadius = 12
        layer.masksToBounds = false
    }
    
    override open var frame: CGRect {
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

