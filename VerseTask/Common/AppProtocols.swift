//
//  AppProtocols.swift
//  VerseTask
//
//  Created by Prashant Kumar Soni on 04/12/24.
//

import Foundation

protocol ApiData: AnyObject{
    func getFirstTimeResponse(_ responseData: [CricketerModel])
    func getResponseFromDB(_ responseData: [CricketerModel])
}
