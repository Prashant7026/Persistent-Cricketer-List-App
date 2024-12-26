//
//  HomeViewController.swift
//  VerseTask
//
//  Created by Prashant Kumar Soni on 04/12/24.
//

import UIKit

class HomeViewController: UIViewController {

    private let cntnrView = UIView()
    private let tableView = UITableView()
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.delegate = self
        }
        print("\(self.navigationController)")
        registercell()
        setupUI()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension HomeViewController{
    private func setupUI(){
        setupCntnrView()
        addCntnrViewConstraints()
        
        setupTableView()
        addTableViewConstraints()
    }
}

extension HomeViewController{
    
    private func setupTableView(){
        cntnrView.addSubview(tableView)
        cntnrView.backgroundColor = UIColor.white
    }
    
    private func addTableViewConstraints(){
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension HomeViewController{
    
    private func setupCntnrView(){
        view.addSubview(cntnrView)
        cntnrView.backgroundColor = UIColor.green
    }
    
    private func addCntnrViewConstraints(){
        cntnrView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}



extension HomeViewController{
    private func registercell(){
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cricketerData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        let lcell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        lcell.lblView.text = viewModel.cricketerData?[indexPath.row].name
        
        cell = lcell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = self.viewModel.cricketerData?[indexPath.row] ?? nil
        let detailVC = AppRouter.getDetailViewController(data)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            UserDefaultOperation.deleteRow(StringConstants.key, index: indexPath.row)
            DispatchQueue.main.async {
                let fetchedData = UserDefaultOperation.getDataFromDB(StringConstants.key)
                self.viewModel.cricketerData = fetchedData
                self.tableView.reloadData()
            }
        }
    }
    
}

extension HomeViewController: ApiData{
    func getFirstTimeResponse(_ responseData: [CricketerModel]) {
        DispatchQueue.main.async {
            self.viewModel.cricketerData = responseData
            UserDefaultOperation.saveDataToDB(StringConstants.key, responseData)
            self.tableView.reloadData()
        }
    }
    
    func getResponseFromDB(_ responseData: [CricketerModel]) {
        self.viewModel.cricketerData = responseData
        self.tableView.reloadData()
    }
}
