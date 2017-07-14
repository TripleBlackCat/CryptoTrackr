//
//  MyPortfolioTableViewCell.swift
//  CryptoTrackr
//
//  Created by Kavilan Nair on 2017/07/13.
//  Copyright © 2017 Kavilan Nair. All rights reserved.
//

import UIKit

class MyPortfolioTableViewCell: UITableViewCell {

    @IBOutlet weak var portfolioImage: UIImageView!
    @IBOutlet weak var portfolioCryptoName: UILabel!
    @IBOutlet weak var cryptoValue: UILabel!
    @IBOutlet weak var numberOfCoins: UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
