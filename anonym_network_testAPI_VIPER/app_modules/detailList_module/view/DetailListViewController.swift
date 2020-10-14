//
//  DetailListViewController.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import UIKit

final class DetailListViewController: UIViewController {
    
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
    
    // MARK: - vewsImage
    let vewsImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "069-visual")?.withRenderingMode(.alwaysTemplate)
        img.contentMode = .scaleAspectFill
        img.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return img
    }()
    
    // MARK: - postImage
    let postImage : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    // MARK: - textView
    var textView : UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tv.font =  UIFont.systemFont(ofSize: 25.0, weight: .regular)
        tv.isEditable = false
        tv.isSelectable = false
        tv.isScrollEnabled = false
        tv.layoutIfNeeded()
        tv.sizeToFit()
        return tv
    }()
    
    // MARK: - viewsLabel
    let viewsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font =  UIFont.systemFont(ofSize: 15.0, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.08
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    // MARK: - likeCounts
    let likeCounts : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font =  UIFont.systemFont(ofSize: 25.0, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.08
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    // MARK: - commentsCounts
    let commentsCounts : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font =  UIFont.systemFont(ofSize: 25.0, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.08
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return label
    }()
    
    // MARK: - postView
    let postView : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .none
        return v
    }()
    
    // MARK: - scrollView
    let scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        return sv
    }()
    
    // MARK: - stackView
    let stackView : UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.layoutMargins = UIEdgeInsets(top: 2, left: 10, bottom: 3, right: 0)
        sv.isLayoutMarginsRelativeArrangement = true
        sv.axis  = .horizontal
        sv.distribution  = .equalSpacing
        sv.alignment = .center
        sv.spacing   = 10.0
        sv.backgroundColor = #colorLiteral(red: 0.4980392157, green: 0.4901960784, blue: 0.4862745098, alpha: 1)
        sv.alpha = 0.8
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
        sv.alpha = 0.5
        return sv
    }()
    
    var presenter : ViewToDetailListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.loadModule()
        setupScrollView()
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        
        postView.layer.cornerRadius = 12
        postView.layer.masksToBounds = true
        
        stackView.layer.cornerRadius = stackView.frame.size.height / 2
        stackView.layer.masksToBounds = true
        
        postImage.roundCorners(corners: [.topLeft, .topRight], radius: 12.0)
        stackViewStats.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 12.0)
        
        let height = textView.contentSize.height + postImage.frame.size.height + 70
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: height)
    }
}

extension DetailListViewController : PresenterToDetailListViewProtocol{
    
    func seeData(list: ItemsList?, indexList: Int?){
        
        let views = list?.stats?.views?.count
        
        let a = views!
        var result = ""
        
        if a >= 1000{
            
            if a >= 10000{
                
                if a >= 100000{
                    
                    if a >= 1000000{
                        result = "\(a)".chopSuffix(6) + "kk"
                    }else{
                        result = "\(a)".chopSuffix(3) + "k"
                    }
                }else{
                    result = "\(a)".chopSuffix(3) + "k"
                }
            }else{
                result = "\(a)".chopSuffix(3) + "k"
            }
        }else{
            result = "\(a)" + "k"
        }
        
        viewsLabel.text = result
        likeCounts.text = "\(list?.stats?.likes?.count ?? 0)"
        commentsCounts.text = "\(list?.stats?.comments?.count ?? 0)"
        
        for i in 0...1{
            if list?.contents![i].type == "TEXT"{
                textView.text = list?.contents![i].data?.value
            }
            
            DispatchQueue.global().async{
                let imageUrl = list?.contents![i].data?.small?.url
                
                if imageUrl != nil{
                    let url = URL(string: imageUrl!)
                    
                    if let data = try? Data(contentsOf: url!)
                    {
                        DispatchQueue.main.async {
                            self.postImage.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
    }
}

extension String {
    func chopSuffix(_ count: Int = 1) -> String {
        return substring(to: index(endIndex, offsetBy: -count))
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
