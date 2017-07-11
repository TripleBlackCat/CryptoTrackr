//
//  CoinOverviewTableViewCell.swift
//  CryptoTrackr
//
//  Created by Kavilan Nair on 2017/07/11.
//  Copyright © 2017 Kavilan Nair. All rights reserved.
//

import UIKit

class CoinOverviewTableViewCell: UITableViewCell {

    @IBOutlet weak var crytoLogo: UIImageView!
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var cryptoPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
