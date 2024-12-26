//
//  SettingsViewController.swift
//  VerseTask
//
//  Created by Prashant Kumar Soni on 04/12/24.
//

import UIKit

class SettingsViewController: UIViewController {

    let viewModel = SettingsViewModel()
    let cntnrView = UIView()
    let clearAllBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }

}

extension SettingsViewController {
    private func setupUI(){
        setupCntnrView()
        addCntnrViewConstraints()
        
        setupClearAllBtnView()
        addClearAllBtnViewConstraints()
    }
}

extension SettingsViewController {
    private func setupCntnrView(){
        view.addSubview(cntnrView)
    }
    
    private func addCntnrViewConstraints(){
        cntnrView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension SettingsViewController {
    private func setupClearAllBtnView(){
        cntnrView.addSubview(clearAllBtn)
        clearAllBtn.setTitle("Clear All", for: .normal)
        clearAllBtn.setTitleColor(UIColor.black, for: .normal)
        clearAllBtn.backgroundColor = UIColor.yellow
        clearAllBtn.layer.cornerRadius = 8.0
        clearAllBtn.addTarget(self, action: #selector(clearAllBtnTapped), for: .touchUpInside)
    }
    
    private func addClearAllBtnViewConstraints(){
        clearAllBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    @objc private func clearAllBtnTapped() {
        viewModel.clearAllData()
    }
}
