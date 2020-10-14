//
//  ListViewController.swift
//  anonym_network_testAPI_VIPER
//
//  Created by maksim on 21.09.2020.
//

import UIKit

final class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var presenter : ViewToListPresenterProtocol?
    
    // MARK: - tableView
    let tableView : UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.separatorStyle = .none
        t.showsVerticalScrollIndicator = false
        t.showsHorizontalScrollIndicator = false
        t.register(ListTableViewCell.self, forCellReuseIdentifier: "Cell")
        t.backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.7568627451, blue: 0.7568627451, alpha: 1)
        return t
    }()
    
    // MARK: - headerView
    let headerView : UIView = {
        let hv = UIView()
        hv.translatesAutoresizingMaskIntoConstraints = false
        hv.backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.7568627451, blue: 0.7568627451, alpha: 1)
        return hv
    }()
    
    // MARK: - sortingOutlet
    let sortingOutlet : UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Набирающие популярность", for: .normal)
        b.titleLabel?.font =  UIFont.systemFont(ofSize: 20.0, weight: .regular)
        b.titleLabel?.numberOfLines = 1
        b.titleLabel?.adjustsFontSizeToFitWidth = true
        b.titleLabel?.minimumScaleFactor = 0.08
        b.backgroundColor = #colorLiteral(red: 1, green: 0.5137254902, blue: 0.5137254902, alpha: 1)
        b.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return b
    }()
    
    fileprivate var list : List?
    fileprivate var sortingValueArray : [String]?
    
    fileprivate let queue = DispatchQueue.global()
    
    fileprivate var toolBar = UIToolbar()
    fileprivate var picker  = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurelList()
        presenter?.dataFetcher()
        
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        
        let width = view.frame.width / 8
        let height = view.frame.height / 22
        
        sortingOutlet.frame = CGRect(x: 0, y: 0, width: width, height: height)
        sortingOutlet.contentEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        sortingOutlet.layer.cornerRadius = sortingOutlet.frame.size.height / 2
    }
    
    @objc func sorting() {
        
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
    
    @objc private func onDoneButtonTapped() {
        dismiss(animated: true, completion: nil)
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
        
        let lastItem = (list?.data?.items!.count)! - 5
        if indexPath.row == lastItem {
            presenter?.dataFetcher()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListTableViewCell
        
        cell.selectionStyle = .none 
        configureCell(cell : cell, for: indexPath)
        
        return cell
    }
    
    private func configureCell(cell : ListTableViewCell, for indexPath: IndexPath) {
        
        let username = list?.data?.items![indexPath.row].author?.name ?? ""
        
        cell.userName.text = "\(username.filter { $0 != "\n" })"
        
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
            }else{
                DispatchQueue.global(qos: .utility).async{
                    let imageUrl = self.list?.data?.items![indexPath.row].contents![i].data?.small?.url
                    guard imageUrl != nil else { return }
                    
                    let url = URL(string: imageUrl!)
                    
                    if let data = try? Data(contentsOf: url!)
                    {
                        DispatchQueue.main.async {
                            cell.postImage.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
        
        DispatchQueue.global(qos: .background).async{
            let imageUrl = self.list?.data?.items![indexPath.row].author?.photo?.data?.extraSmall?.url
            
            if imageUrl != nil{
                let url = URL(string: imageUrl!)
                
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
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        let heightRatio = UIScreen.main.bounds.height / 736
        return 400 * heightRatio
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let post = list?.data?.items![indexPath.row]
        presenter?.goToDetail(navigationController: navigationController!, list: post, indexList: indexPath.row)
    }
}

extension ListViewController : PresenterToListViewProtocol{
    
    func seeData (list : List?){
        
        self.list = list
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func seeSorting(sortingValueArray : [String]?){
        self.sortingValueArray = sortingValueArray
    }
    
    func seeError(errorMessage : String?){
        errorAlert(alertMessage : errorMessage)
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
        
        presenter?.sortingDidSelect(indexSort: row)
    }
}

