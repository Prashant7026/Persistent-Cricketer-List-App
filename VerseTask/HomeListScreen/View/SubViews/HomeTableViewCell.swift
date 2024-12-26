//
//  HomeTableViewCell.swift
//  VerseTask
//
//  Created by Prashant Kumar Soni on 04/12/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var cntnrView: UIView!
    @IBOutlet weak var lblView: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
}

extension HomeTableViewCell{
    private func setupUI(){
        
    }
}
