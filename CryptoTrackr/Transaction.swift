//
//  Transaction.swift
//  CryptoTrackr
//
//  Created by Kavilan Nair on 2017/07/13.
//  Copyright © 2017 Kavilan Nair. All rights reserved.
//

import Foundation
import Gloss

class Transaction{
    
    var firebaseUserID: String?
    var id: String?
    var coinName: String?
    var numberOfCoins: String?
    var pricePerCoin: String?
    var timeStamp: String?
    var isHeld: String?
    
    
    required init?(json: JSON) {
        //self.firebaseUserID = "This is the key wtf"
        self.coinName = "coinName" <~~ json
        self.id = "id" <~~ json
        self.isHeld = "isHeld" <~~ json
        self.numberOfCoins = "numberOfCoins" <~~ json
        self.pricePerCoin = "pricePerCoin" <~~ json
        }
    
    func toJSON() -> JSON? {
        return jsonify([
            "coinName" ~~> self.coinName,
            "id" ~~> self.id,
            "isHeld" ~~> self.isHeld,
            "numberOfCoins" ~~> self.numberOfCoins,
            "pricePerCoin" ~~> self.pricePerCoin
        ])
    }
    
    
}
