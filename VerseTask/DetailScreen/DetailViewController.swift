//
//  DetailViewController.swift
//  VerseTask
//
//  Created by Prashant Kumar Soni on 04/12/24.
//

import UIKit

class DetailViewController: UIViewController {

    let viewModel: DetailViewModel
    private let cntnrView = UIView()
    private let name = UITextField()
    private let age = UITextField()
    private let country = UITextField()
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI(){
        setupCntnrView()
        addCntnrViewConstraints()
        
        setupNameLbl()
        addNameLbViewConstraints()
        setupAgeLbl()
        addAgeLbViewConstraints()
        setupCountryLbl()
        addCountryLbViewConstraints()
    }
}

extension DetailViewController{
    
    private func setupCntnrView(){
        view.addSubview(cntnrView)
        cntnrView.backgroundColor = UIColor.green
    }
    
    private func addCntnrViewConstraints(){
        cntnrView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    private func setupNameLbl(){
        cntnrView.addSubview(name)
        name.text = viewModel.data?.name
        name.isUserInteractionEnabled = viewModel.openType == .edit ? true : false
    }
    
    private func addNameLbViewConstraints(){
        name.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(16.0)
            make.top.equalTo(cntnrView.snp.top).offset(120.0)
        }
    }
    
    private func setupAgeLbl(){
        cntnrView.addSubview(age)
        age.text = "\(viewModel.data?.age ?? 0)"
        age.isUserInteractionEnabled = viewModel.openType == .edit ? true : false
    }
    
    private func addAgeLbViewConstraints(){
        age.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(16.0)
            make.top.equalTo(name.snp.bottom).offset(16.0)
        }
    }
    private func setupCountryLbl(){
        cntnrView.addSubview(country)
        country.text = viewModel.data?.country
        country.isUserInteractionEnabled = viewModel.openType == .edit ? true : false
    }
    
    private func addCountryLbViewConstraints(){
        country.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(16.0)
            make.top.equalTo(age.snp.bottom).offset(16.0)
        }
    }
}
