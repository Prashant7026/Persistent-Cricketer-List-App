//
//  Networking.swift
//  VerseTask
//
//  Created by Prashant Kumar Soni on 04/12/24.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case noData
    case errorParsingJson
}

class Networking{
    func apiCall(urlString : String , completionHandler : @escaping (Result<[CricketerModel], Error>) -> ()) async {
        
        if let apiUrl = URL(string: urlString) {
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: apiUrl) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        completionHandler(.failure(NetworkError.invalidUrl))
                    }
                }
                
                guard let responseData = data else {
                    DispatchQueue.main.async {
                        completionHandler(.failure(NetworkError.noData))
                    }
                    return
                }
                
                print("\(responseData.count)")
                
                do {
                    let decodedData = try JSONDecoder().decode([CricketerModel].self, from: responseData)
                    
                    DispatchQueue.main.async {
                        completionHandler(.success(decodedData))
                    }
                    
                } catch {
                    DispatchQueue.main.async {
                        completionHandler(.failure(NetworkError.errorParsingJson))
                    }
                }
            }
            
            dataTask.resume()
        } else {
           print("URL is not valid!")
        }
    }
}
