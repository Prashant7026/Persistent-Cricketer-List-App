//
//  AppDelegate.swift
//  VerseTask
//
//  Created by Prashant Kumar Soni on 04/12/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    weak var delegate: ApiData?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if isFirstLaunch() {
            print("App launched for the first time. Making API call")
            Task{
                await fetchCricketersData()
            }
        } else {
            print("App already launched. Not Making API call")
            let data = UserDefaultOperation.getDataFromDB(StringConstants.key)
            if let data = data{
                DispatchQueue.main.async {
                    self.delegate?.getResponseFromDB(data)
                }
            }
        }
        
        return true
    }
    
    private func isFirstLaunch() -> Bool {
        let userDefaults = UserDefaults.standard
        if userDefaults.bool(forKey: "HasLaunchedBefore") {
            return false
        } else {
            userDefaults.set(true, forKey: "HasLaunchedBefore")
            userDefaults.synchronize()
            return true
        }
    }
    
    func fetchCricketersData() async {
        let urlString = StringConstants.api
        let network = Networking()
        await network.apiCall(urlString: urlString) { result in
            switch result {
            case .success(let cricketers):
                DispatchQueue.main.async{
                    self.delegate?.getFirstTimeResponse(cricketers)
                }
            case .failure(let error):
                print("Error fetching cricketers data: \(error.localizedDescription)")
            }
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

