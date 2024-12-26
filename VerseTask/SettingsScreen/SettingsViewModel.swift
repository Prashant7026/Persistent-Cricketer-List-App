//
//  SettingsViewModel.swift
//  VerseTask
//
//  Created by Prashant Kumar Soni on 04/12/24.
//

import Foundation
import UIKit

class SettingsViewModel{
    
    func clearAllData() {
        Task{
            UserDefaultOperation.deletData(StringConstants.key)
            if let appDelegate = await UIApplication.shared.delegate as? AppDelegate {
                await appDelegate.fetchCricketersData()
            }
        }
    }
}
