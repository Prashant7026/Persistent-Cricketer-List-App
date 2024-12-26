//
//  DetailViewModel.swift
//  VerseTask
//
//  Created by Prashant Kumar Soni on 04/12/24.
//

import Foundation

enum SelectRowType{
    case edit, detail
}

class DetailViewModel{
    var data: CricketerModel?
    var openType: SelectRowType? = .detail
    
    init(data: CricketerModel? = nil, openType: SelectRowType? = .detail) {
        self.data = data
        self.openType = openType
    }
}
