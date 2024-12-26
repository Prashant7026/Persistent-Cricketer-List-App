//
//  AppRouter.swift
//  VerseTask
//
//  Created by Prashant Kumar Soni on 04/12/24.
//

import Foundation

class AppRouter: NSObject {
    class func getDetailViewController(_ data: CricketerModel?) -> DetailViewController{
        let viewModel = AppRouter.getDetailViewModel(data)
        return DetailViewController(viewModel: viewModel)
    }
}

extension AppRouter{
    class func getDetailViewModel(_ data: CricketerModel?) -> DetailViewModel{
        return DetailViewModel(data: data)
    }
}
