//
//  ViewController.swift
//  VerseTask
//
//  Created by Prashant Kumar Soni on 04/12/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let bottomTabBar = UITabBarController()
    
    let homeVC = HomeViewController()
    let settingVC = SettingsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let homeNavController = UINavigationController(rootViewController: homeVC)
        let settingNavController = UINavigationController(rootViewController: settingVC)
        setupUI()
    }
}

extension ViewController{
    private func setupUI(){
        setupTabBottomBar()
        addTabBottomBarConstraints()
    }
}

extension ViewController{
    private func setupTabBottomBar(){
        let tab1 = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        let tab2 = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 1)
        
        homeVC.tabBarItem = tab1
        settingVC.tabBarItem = tab2
        
        homeVC.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        settingVC.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        
        bottomTabBar.viewControllers = [homeVC, settingVC]
        bottomTabBar.tabBar.backgroundColor = UIColor.white
        
        self.view.addSubview(bottomTabBar.view)
        addChild(bottomTabBar)
        bottomTabBar.didMove(toParent: self)
    }
    
    private func addTabBottomBarConstraints(){
        guard let tabBarView = bottomTabBar.view else { return }
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}
