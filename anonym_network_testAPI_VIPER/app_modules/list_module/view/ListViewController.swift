//
//  ListViewController.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import UIKit

final class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var presenter : ViewToListPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var sortingOutlet: UIButton!
    
    fileprivate var list : List?
    fileprivate var after : String? = ""
    fileprivate var orderBySortValue : String? = "mostPopular"
    
    fileprivate var sortingValueArray : [String]?
    
    fileprivate var toolBar = UIToolbar()
    fileprivate var picker  = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurelList()
        sortingOutlet.setTitle("Набирающие популярность", for: .normal)
        presenter?.dataFetcher(after : "\(after!)", orderBy : "\(orderBySortValue!)")
        
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        
        let width = view.frame.width / 8
        let height = view.frame.height / 22
        
        sortingOutlet.frame = CGRect(x: 0, y: 0, width: width, height: height)
        sortingOutlet.contentEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        
    }
    
    @IBAction func sorting(_ sender: UIButton) {
        
        presenter?.sortingTap()
        
        picker = UIPickerView.init()
        picker.delegate = self
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)
        
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
        
    }
    
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list?.data?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = (list?.data?.items!.count)! - 1
        if indexPath.row == lastItem {
            presenter?.dataFetcher(after : "\(after!)", orderBy : "\(orderBySortValue!)")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListTableViewCell
        
        cell.selectionStyle = .none 
        configureCell(cell: cell, for: indexPath)
        
        return cell
    }
    
    private func configureCell(cell: ListTableViewCell, for indexPath: IndexPath) {
        
        cell.likeCounts.font = UIFont.systemFont(ofSize: 25.0, weight: .regular)
        cell.commentsCounts.font = UIFont.systemFont(ofSize: 25.0, weight: .regular)
        cell.userName.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
        cell.postText.font = UIFont.systemFont(ofSize: 60.0, weight: .regular)
        cell.postText.textAlignment = .justified
        
        cell.likeCounts.adjustsFontSizeToFitWidth = true
        cell.commentsCounts.adjustsFontSizeToFitWidth = true
        cell.userName.adjustsFontSizeToFitWidth = true
        cell.postText.adjustsFontSizeToFitWidth = true
        
        cell.likeCounts.minimumScaleFactor = 0.08
        cell.commentsCounts.minimumScaleFactor = 0.08
        cell.postText.minimumScaleFactor = 0.08
        cell.userName.minimumScaleFactor = 0.08
        
        let username = list?.data?.items![indexPath.row].author?.name ?? ""
        cell.userName.text = "\(username.filter { $0 != "\n" })"
        cell.userName.numberOfLines = 1
        cell.userName.lineBreakMode = .byWordWrapping
        
        cell.likeCounts.text = "\(list?.data?.items![indexPath.row].stats?.likes?.count ?? 0)"
        cell.commentsCounts.text = "\(list?.data?.items![indexPath.row].stats?.comments?.count ?? 0)"
        
        for i in 0...1{
            if list?.data?.items![indexPath.row].contents![i].type == "TEXT"{
                let str = list?.data?.items![indexPath.row].contents![i].data?.value ?? ""
                let nsString = str as NSString
                if nsString.length > 0
                {
                    cell.postText.text = nsString.substring(with: NSRange(location: 0, length: nsString.length > 180 ? 180 : nsString.length))
                }
            }
            
            DispatchQueue.global().async{
                let imageUrl = self.list?.data?.items![indexPath.row].contents![i].data?.small?.url
                
                if imageUrl != nil{
                    let url = URL(string: "\(imageUrl!)")
                    
                    if let data = try? Data(contentsOf: url!)
                    {
                        DispatchQueue.main.async {
                            
                            cell.postImage.image = UIImage(data: data)
                        }
                    }
                }else{
                }
            }
        }
        
        cell.threePointsImage.image = UIImage(named: "040-settings-1")
        cell.likeImage.image = UIImage(named: "058-like")
        cell.commentsImage.image = UIImage(named: "042-chat")
        cell.shareImage.image = UIImage(named: "007-share")
        
        cell.threePointsImage.image =  cell.threePointsImage.image?.withRenderingMode(.alwaysTemplate)
        cell.likeImage.image =  cell.likeImage.image?.withRenderingMode(.alwaysTemplate)
        cell.commentsImage.image =  cell.commentsImage.image?.withRenderingMode(.alwaysTemplate)
        cell.shareImage.image =  cell.shareImage.image?.withRenderingMode(.alwaysTemplate)
        
        cell.threePointsImage.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        cell.likeImage.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.commentsImage.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.shareImage.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        DispatchQueue.global().async{ [self] in
            
            let imageUrl = list?.data?.items![indexPath.row].author?.photo?.data?.extraSmall?.url
            
            if imageUrl != nil{
                let url = URL(string: "\(imageUrl!)")
                
                if let data = try? Data(contentsOf: url!)
                {
                    DispatchQueue.main.async {
                        cell.userPhoto.image = UIImage(data: data)
                    }
                }
            }else{
                DispatchQueue.main.async {
                    cell.userPhoto.image = UIImage(named: "053-user")
                }
            }
        }
        
        cell.firstSVHeightConstraint.constant = view.frame.height / 16
        cell.stackViewHeightConstraint.constant = view.frame.height / 16
        cell.userPhoto.layer.cornerRadius = (view.frame.height / 16) / 2.5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        let heightRatio = UIScreen.main.bounds.height / 736
        return 400 * heightRatio
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.goToDetail(navigationController: navigationController!, list: list, indexList: indexPath.row)
    }
    
}

extension ListViewController : PresenterToListViewProtocol{
    
    func seeData (list : List?){
        if after == ""{
            self.list = list
            tableView.reloadData()
            after = list?.data?.cursor
        }else{
            guard let list = list else { return }
            let item = list.data?.items
            guard item != nil else { return errorAlert(alertMessage : "\(list.errors![0].orderBy!)")}
            
            self.list?.data?.items?.append(contentsOf: item!)
            tableView.reloadData()
            after = list.data?.cursor
        }
      
    }
    
    func seeSorting(sortingValueArray : [String]?){
        
        self.sortingValueArray = sortingValueArray
    }
}

extension ListViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sortingValueArray!.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sortingValueArray?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch sortingValueArray![row] {
        case "Набирающие популярность":
            self.orderBySortValue = "mostPopular"
        case "Наиболее комментируемые":
            self.orderBySortValue = "mostCommented"
        case "Новые":
            self.orderBySortValue = "createdAt"
        default:
            self.orderBySortValue = "mostPopular"
        }
        
        sortingOutlet.setTitle("\(self.sortingValueArray![row])", for: .normal)
        self.after = ""
        presenter?.dataFetcher(after : "\(after!)", orderBy : "\(orderBySortValue!)")
    }
}

