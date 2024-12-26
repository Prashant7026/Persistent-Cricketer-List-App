//
//  UserDefaultOperation.swift
//  VerseTask
//
//  Created by Prashant Kumar Soni on 04/12/24.
//

import Foundation

class UserDefaultOperation{
    
    static func saveDataToDB(_ key: String, _ data: [CricketerModel]) {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(data)
            defaults.set(data, forKey: key)
        } catch {
            print("Fail to Save Data")
        }
    }
    
    static func getDataFromDB(_ key: String) -> [CricketerModel]?{
        let defaults = UserDefaults.standard
        guard let data = defaults.data(forKey: key) else { return nil }
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([CricketerModel].self, from: data)
            return decodedData
        } catch {
            print("Failed to decode Array from DB: \(error)")
            return nil
        }
    }
    
    static func deletData(_ key: String) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
    }
    
    static func deleteRow(_ key: String, index: Int) {
        let defaults = UserDefaults.standard
        
        guard var storedData = self.getDataFromDB(key) else {
            print("No data found for key \(key)")
            return
        }
        
        guard index >= 0 && index < storedData.count else {
            print("Invalid index")
            return
        }
        
        storedData.remove(at: index)
        
        self.saveDataToDB(key, storedData)
        
    }
}
