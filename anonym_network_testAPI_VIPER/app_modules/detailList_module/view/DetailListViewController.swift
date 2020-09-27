//
//  DetailListViewController.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import UIKit

final class DetailListViewController: UIViewController {
    
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var commentsImage: UIImageView!
    @IBOutlet weak var shareImage: UIImageView!
    @IBOutlet weak var vewsImage: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var likeCounts: UILabel!
    @IBOutlet weak var commentsCounts: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackViewStats: UIStackView!
    
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var stackViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackViewWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var stackViewStatsHeightConstraint: NSLayoutConstraint!
    
    var presenter : ViewToDetailListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.loadModule()
        configureDetailList()
        
    }
  
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        
        stackView.layoutMargins = UIEdgeInsets(top: 2, left: 10, bottom: 3, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        stackViewStats.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        stackViewStats.isLayoutMarginsRelativeArrangement = true
        
        stackViewStatsHeightConstraint.constant = view.frame.height / 16
        
        stackViewWidthConstraint.constant = 80
        
        let height = self.textView.contentSize.height + imageViewHeightConstraint.constant + 70
        scrollView.contentSize = CGSize(width: 375, height: height )
    }
}

extension DetailListViewController : PresenterToDetailListViewProtocol{
    
    func seeData(list: List?, indexList: Int?){
        
        let views = list?.data?.items![indexList!].stats?.views?.count
        
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
        
        viewsLabel.text = "\(result)"
        likeCounts.text = "\(list?.data?.items![indexList!].stats?.likes?.count ?? 0)"
        commentsCounts.text = "\(list?.data?.items![indexList!].stats?.comments?.count ?? 0)"
        
        for i in 0...1{
            if list?.data?.items![indexList!].contents![i].type == "TEXT"{
                textView.text = list?.data?.items![indexList!].contents![i].data?.value
            }
            
            DispatchQueue.global().async{
                let imageUrl = list?.data?.items![indexList!].contents![i].data?.small?.url
                
                if imageUrl != nil{
                    let url = URL(string: "\(imageUrl!)")
                    
                    if let data = try? Data(contentsOf: url!)
                    {
                        DispatchQueue.main.async {
                            self.imageView.image = UIImage(data: data)
                            self.imageView.contentMode = .scaleAspectFill
                        }
                    }
                }else{
                }
            }
        }
    }
}

extension UIStackView {
    
    func addBackground(color: UIColor) {
        let subview = UIView(frame: bounds)
        
        subview.layer.cornerRadius = subview.bounds.size.height/4
        subview.backgroundColor = color
        subview.alpha = 0.8
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subview, at: 0)
    }
}

extension String {
    func chopSuffix(_ count: Int = 1) -> String {
       return substring(to: index(endIndex, offsetBy: -count))
    }
}
